//
//  CareerStatsTests.swift
//  nrlstatsTests
//
//  Created by Marc O'Neill on 30/07/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import XCTest
@testable import nrlstats

class CareerStatsTests: XCTestCase {

    let jsonData = """
        {
            "games": 215,
            "points": 64,
            "tries": 16,
            "win_percentage": 55.3
        }
    """.data(using: .utf8)!

    // MARK: - Success cases

    func testGames_GivenJsonData() {
        let stats = try? JSONDecoder().decode(CareerStats.self, from: jsonData)
        XCTAssert(stats?.games == 215, "Incorrect games for CareerStats")
    }

    func testPoints_GivenJsonData() {
        let stats = try? JSONDecoder().decode(CareerStats.self, from: jsonData)
        XCTAssert(stats?.points == 64, "Incorrect games for CareerStats")
    }

    func testTries_GivenJsonData() {
        let stats = try? JSONDecoder().decode(CareerStats.self, from: jsonData)
        XCTAssert(stats?.tries == 16, "Incorrect games for CareerStats")
    }

    func testWinPercentage_GivenJsonData() {
        let stats = try? JSONDecoder().decode(CareerStats.self, from: jsonData)
        XCTAssert(stats?.winPercentage == 55.3, "Incorrect games for CareerStats")
    }

    // MARK: - Failing cases

    func testThrowsError_GivenIncorrectGamesType() {
        let jsonData = """
            {
                "games": "215",
                "points": 64,
                "tries": 16,
                "win_percentage": 55.3
            }
        """.data(using: .utf8)!

        XCTAssertThrowsError(try JSONDecoder().decode(CareerStats.self, from: jsonData))
    }

    func testThrowsError_GivenMissingJsonElement() {
        let jsonData = """
            {
                "games": "215",
                "points": 64,
                "tries": 16
            }
        """.data(using: .utf8)!

        XCTAssertThrowsError(try JSONDecoder().decode(CareerStats.self, from: jsonData))
    }
    
}
