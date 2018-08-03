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
    var isGetPlayerImageDataCalled = false
    var isGetMatchStatsCalled = false

    // Image API calls
    func getPlayerImageData(playerId: Int, completion: @escaping (Data?, String?) -> ()) {
        isGetPlayerImageDataCalled = true
        imageCompleteClosure = completion
    }

    // Stats API calls
    var statsCompleteClosure: (([MatchStat]?, String?) -> ())!
    var imageCompleteClosure: ((Data?, String?) -> ())!

    func getMatchStats(matchId: String, completion: @escaping ([MatchStat]?, String?) -> ()) {
        isGetMatchStatsCalled = true
        statsCompleteClosure = completion
    }

    func fetchStatsSuccess() {
        statsCompleteClosure([MatchStat](), nil)
    }

    func fetchStatsFail(error: String) {
        statsCompleteClosure(nil, error)
    }

    func fetchImageSuccess() {
        imageCompleteClosure(Data(), nil)
    }

    func fetchImageFail(error: String) {
        imageCompleteClosure(nil, error)
    }

}
