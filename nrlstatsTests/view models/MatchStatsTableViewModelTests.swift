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

    func testStatsApiErrorMessage_GivenNetworkManagerCallFails() {
        let errorMessage = "Failed call"
        sut?.load()
        networkManager?.fetchApiFailure(.matchStats, error: errorMessage)
        XCTAssert(sut?.fetchError == errorMessage)
    }
}
