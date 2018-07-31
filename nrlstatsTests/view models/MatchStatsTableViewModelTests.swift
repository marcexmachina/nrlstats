//
//  MatchStatsTableViewModelTests.swift
//  nrlstatsTests
//
//  Created by Marc O'Neill on 31/07/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import XCTest
@testable import nrlstats

class MatchStatsTableViewModelTests: XCTestCase {

    class MockNetworkManager: NetworkManagerProtocol {
        var isGetMatchStatsCalled = false

        var completeClosure: (([MatchStat]?, String?) -> ())!

        func getMatchStats(matchId: String, completion: @escaping ([MatchStat]?, String?) -> ()) {
            isGetMatchStatsCalled = true
            completeClosure = completion
        }

        func fetchSuccess() {
            completeClosure([MatchStat](), nil)
        }

        func fetchFail(error: String) {
            completeClosure(nil, error)
        }

    }

    var sut: MatchStatsTableViewModel?
    var networkManager: MockNetworkManager?
    
    override func setUp() {
        super.setUp()
        networkManager = MockNetworkManager()
        sut = MatchStatsTableViewModel(networkManager: networkManager!)
    }
    
    override func tearDown() {
        sut = nil
        networkManager = nil
        super.tearDown()
    }

    func testLoadCallsGetMatchStats_GivenNetworkManager() {
        sut?.load()
        XCTAssert(networkManager!.isGetMatchStatsCalled)
    }

    func testErrorMessage_GivenNetworkManagerCallFails() {
        let errorMessage = "Failed call"
        sut?.load()
        networkManager?.fetchFail(error: errorMessage)
        XCTAssert(sut?.fetchError == errorMessage)
    }
    
}
