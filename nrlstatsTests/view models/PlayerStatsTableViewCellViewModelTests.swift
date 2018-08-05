//
//  PlayerStatsTableViewCellModelTests.swift
//  nrlstatsTests
//
//  Created by Marc O'Neill on 05/08/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import XCTest
@testable import nrlstats

class PlayerStatsTableViewCellViewModelTests: XCTestCase {

    var sut: PlayerStatsTableViewCellViewModel?
    var networkManager: MockNetworkManager?
    
    override func setUp() {
        super.setUp()
        networkManager = MockNetworkManager()
        sut = PlayerStatsTableViewCellViewModel(playerA: Player.mock(), playerB: Player.mock(), networkManager: networkManager!)
    }
    
    override func tearDown() {
        sut = nil
        networkManager = nil
        super.tearDown()
    }

    func testPlayerAStatViewModelNotNil() {
        XCTAssertNotNil(sut?.playerAStatViewModel())
    }

    func testPlayerBStatViewModelNotNil() {
        XCTAssertNotNil(sut?.playerBStatViewModel())
    }
}
