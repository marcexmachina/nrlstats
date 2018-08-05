
//
//  DetailedPlayerStatsViewModelTests.swift
//  nrlstatsTests
//
//  Created by Marc O'Neill on 05/08/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import XCTest
@testable import nrlstats

class DetailedPlayerStatsViewModelTests: XCTestCase {

    var sut: DetailedPlayerStatsViewModel?
    var networkManager: MockNetworkManager?
    
    override func setUp() {
        super.setUp()
        networkManager = MockNetworkManager()
        sut = DetailedPlayerStatsViewModel(player: Player.mock(), networkManager: networkManager!)
    }
    
    override func tearDown() {
        sut = nil
        networkManager = nil
        super.tearDown()
    }

    func testLoadCallsGetPlayerStats() {
        sut?.load()
        XCTAssert(networkManager!.isGetPlayerStatsCalled)
    }

    func testviewModelForHeaderViewNotNil() {
        XCTAssertNotNil(sut?.viewModelForHeaderView())
    }

    func testNumberOfSections() {
       XCTAssert(sut?.numberOfSections == 1)
    }

    func testNumberOfRowsInSection_GivenNoStats() {
        XCTAssert(sut?.numberOfRowsInSection(section: 0) == 0)
    }
}
