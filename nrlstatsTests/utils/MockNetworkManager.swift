//
//  MockNetworkManager.swift
//  nrlstatsTests
//
//  Created by Marc O'Neill on 03/08/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import Foundation
@testable import nrlstats

class MockNetworkManager: NetworkManagerProtocol {

    enum APIType {
        case matchStats
        case playerStats
        case playerImage
    }

    var isGetPlayerImageDataCalled = false
    var isGetMatchStatsCalled = false
    var isGetPlayerStatsCalled = false

    // Image API calls
    func getPlayerImageData(playerId: Int, completion: @escaping (Data?, String?) -> ()) {
        isGetPlayerImageDataCalled = true
        imageCompleteClosure = completion
    }

    // Stats API calls
    
    var matchStatsCompleteClosure: (([MatchStat]?, String?) -> ())!
    var playerStatsCompleteClosure: ((Player?, String?) -> ())!
    var imageCompleteClosure: ((Data?, String?) -> ())!

    func getMatchStats(matchId: String, completion: @escaping ([MatchStat]?, String?) -> ()) {
        isGetMatchStatsCalled = true
        matchStatsCompleteClosure = completion
    }

    func getPlayerStats(teamId: Int, playerId: Int, completion: @escaping (Player?, String?) -> ()) {
        isGetPlayerStatsCalled = true
        playerStatsCompleteClosure = completion
    }

    func fetchApiSuccess(_ apiType: APIType) {
        switch apiType {
        case .matchStats:
            matchStatsCompleteClosure([MatchStat](), nil)
        case .playerStats:
            playerStatsCompleteClosure(Player.mock(), nil)
        case .playerImage:
            imageCompleteClosure(Data(), nil)
        }
    }

    func fetchApiFailure(_ apiType: APIType, error: String) {
        switch apiType {
        case .matchStats:
            matchStatsCompleteClosure(nil, error)
        case .playerStats:
            playerStatsCompleteClosure(nil, error)
        case .playerImage:
            imageCompleteClosure(nil, error)
        }
    }
}
