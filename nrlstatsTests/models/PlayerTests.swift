//
//  PlayerTests.swift
//  nrlstatsTests
//
//  Created by Marc O'Neill on 30/07/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import XCTest
@testable import nrlstats

class PlayerTests: XCTestCase {

    // MARK: - Success cases

    func testId_GivenJsonData() {
        let jsonData = """
            {
                "id": 23,
                "position": "",
                "full_name": "",
                "short_name": "",
                "stat_value": 0,
                "jumper_number": 0
            }
        """.data(using: .utf8)!

        let player = try? JSONDecoder().decode(Player.self, from: jsonData)
        XCTAssert(player?.id == 23, "Incorrect ID for player")
    }

    func testPosition_GivenJsonData() {
        let jsonData = """
            {
                  "id": 23,
                  "position": "Full Back",
                  "full_name": "",
                  "short_name": "",
                  "stat_value": 0,
                  "jumper_number": 0
            }
        """.data(using: .utf8)!

        let player = try? JSONDecoder().decode(Player.self, from: jsonData)
        XCTAssert(player?.position == "Full Back", "Incorrect position for player")
    }

    func testFullName_GivenJsonData() {
        let jsonData = """
            {
                  "id": 23,
                  "position": "",
                  "full_name": "Test Player",
                  "short_name": "",
                  "stat_value": 0,
                  "jumper_number": 0
            }
        """.data(using: .utf8)!

        let player = try? JSONDecoder().decode(Player.self, from: jsonData)
        XCTAssert(player?.fullName == "Test Player", "Incorrect fullName for player")
    }

    func testShortName_GivenJsonData() {
        let jsonData = """
            {
                  "id": 23,
                  "position": "",
                  "full_name": "",
                  "short_name": "T. Player",
                  "stat_value": 0,
                  "jumper_number": 0
            }
        """.data(using: .utf8)!

        let player = try? JSONDecoder().decode(Player.self, from: jsonData)
        XCTAssert(player?.shortName == "T. Player", "Incorrect shortName for player")
    }

    func testStatValue_GivenJsonData() {
        let jsonData = """
            {
                  "id": 23,
                  "position": "",
                  "full_name": "",
                  "short_name": "",
                  "stat_value": 100,
                  "jumper_number": 0
            }
        """.data(using: .utf8)!

        let player = try? JSONDecoder().decode(Player.self, from: jsonData)
        XCTAssert(player?.statValue == 100, "Incorrect statValue for player")
    }

    func testJumperNumber_GivenJsonData() {
        let jsonData = """
            {
                  "id": 23,
                  "position": "",
                  "full_name": "",
                  "short_name": "",
                  "stat_value": 0,
                  "jumper_number": 7
            }
        """.data(using: .utf8)!

        let player = try? JSONDecoder().decode(Player.self, from: jsonData)
        XCTAssert(player?.jumperNumber == 7, "Incorrect jumperNumber for player")
    }

    // MARK: - Failing cases

    func testThrowsError_GivenIncorrectIdTypeInJsonData() {
        let jsonData = """
            {
                "id": "23",
                "name": "",
                "code": "",
                "short_name": "",
                "top_players": []
            }
        """.data(using: .utf8)!

        XCTAssertThrowsError(try JSONDecoder().decode(Player.self, from: jsonData))
    }

    func testThrowsError_GivenMissingElementInJsonData() {
        let jsonData = """
            {
                  "id": 23,
                  "position": "",
                  "short_name": "",
                  "stat_value": 0,
                  "jumper_number": 7
            }
        """.data(using: .utf8)!

        XCTAssertThrowsError(try JSONDecoder().decode(Player.self, from: jsonData))
    }
}
