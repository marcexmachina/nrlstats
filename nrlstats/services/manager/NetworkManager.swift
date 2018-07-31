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

    private let router = Router<StatsApi>()

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
        router.request(.matchStats(match: matchId), session: session) { data, response, error in
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
}
