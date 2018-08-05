//
//  APIService.swift
//  nrlstats
//
//  Created by Marc O'Neill on 31/07/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import Foundation

protocol NetworkManagerProtocol {
    func getMatchStats(matchId: String, completion: @escaping (_ matchStats: [MatchStat]?, _ error: String?) -> ())
    func getPlayerImageData(playerId: Int, completion: @escaping(_ imageData: Data?, _ error: String?) -> ())
    func getPlayerStats(teamId: Int, playerId: Int, completion: @escaping (_ matchStats: Player?, _ error: String?) -> ())
}

class NetworkManager: NetworkManagerProtocol {

    var session: URLSession!

    init(session: URLSession) {
        self.session = session
    }

    enum NetworkResponse: String {
        case success
        case badRequest = "Bad request"
        case failed = "Request failed"
        case noData = "Response didn't return any data"
        case unableToDecode = "Could not decode response"
    }

    enum Result<String> {
        case success
        case failure(String)
    }

    // MARK: - Private Properties

    private let statsRouter = Router<StatsApi>()
    private let mediaRouter = Router<MediaApi>()

    // MARK: - Methods

    func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299:
            return .success
        case 501...599:
            return .failure(NetworkResponse.badRequest.rawValue)
        default:
            return .failure(NetworkResponse.failed.rawValue)
        }
    }

    func getMatchStats(matchId: String, completion: @escaping (_ matchStats: [MatchStat]?, _ error: String?) -> ()) {
        statsRouter.request(.matchStats(match: matchId), session: session) { data, response, error in
            if error != nil {
                completion(nil, "Problem performing request")
            }

            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let data = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode([MatchStat].self, from: data)
                        completion(apiResponse, nil)
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let error):
                    completion(nil, error)
                }
            }
        }
    }

    func getPlayerStats(teamId: Int, playerId: Int, completion: @escaping (_ player: Player?, _ error: String?) -> ()) {
        statsRouter.request(.playerStats(teamId: teamId, playerId: playerId), session: session) { data, response, error in
            if error != nil {
                completion(nil, "Problem performing request")
            }

            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let data = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(Player.self, from: data)
                        completion(apiResponse, nil)
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let error):
                    completion(nil, error)
                }
            }
        }
    }

    func getPlayerImageData(playerId: Int, completion: @escaping(_ imageData: Data?, _ error: String?) -> ()) {
        mediaRouter.request(.playerHeadshot(playerId: playerId), session: session) { data, response, error in
            if error != nil {
                completion(nil, "Problem performing request")
            }

            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let data = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    completion(data, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
        }
    }
}
