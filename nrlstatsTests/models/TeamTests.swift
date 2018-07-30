//
//  TeamTests.swift
//  nrlstatsTests
//
//  Created by Marc O'Neill on 30/07/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import XCTest
@testable import nrlstats

class TeamTests: XCTestCase {

    let stubbedPlayerJson = """
        [
            {
                "id": 115370,
                "position": "Full Back",
                "full_name": "Dylan Edwards",
                "short_name": "D. Edwards",
                "stat_value": 221,
                "jumper_number": 1
            },
            {
                "id": 109705,
                "position": "Prop Forward",
                "full_name": "James Tamou",
                "short_name": "J. Tamou",
                "stat_value": 163,
                "jumper_number": 8
            }
        ]
    """

    // MARK: - Success cases
    
    func testId_GivenJsonData() {
        let jsonData = """
            {
                "id": 23,
                "name": "",
                "code": "",
                "short_name": "",
                "top_players": []
            }
        """.data(using: .utf8)!

        let team = try? JSONDecoder().decode(Team.self, from: jsonData)
        XCTAssert(team?.id == 23, "Incorrect ID for team")
    }

    func testName_GivenJsonData() {
        let jsonData = """
            {
                "id": 1,
                "name": "Test",
                "code": "",
                "short_name": "",
                "top_players": []
            }
        """.data(using: .utf8)!

        let team = try? JSONDecoder().decode(Team.self, from: jsonData)
        XCTAssert(team?.name == "Test", "Incorrect name for team")
    }

    func testCode_GivenJsonData() {
        let jsonData = """
            {
                "id": 1,
                "name": "",
                "code": "TES",
                "short_name": "",
                "top_players": []
            }
        """.data(using: .utf8)!

        let team = try? JSONDecoder().decode(Team.self, from: jsonData)
        XCTAssert(team?.code == "TES", "Incorrect code for team")
    }

    func testShortName_GivenJsonData() {
        let jsonData = """
            {
                "id": 1,
                "name": "",
                "code": "",
                "short_name": "Short",
                "top_players": []
            }
        """.data(using: .utf8)!

        let team = try? JSONDecoder().decode(Team.self, from: jsonData)
        XCTAssert(team?.shortName == "Short", "Incorrect shortName for team")
    }

    func testTopPlayers_GivenJsonData() {
        let jsonData = """
            {
                "id": 1,
                "name": "",
                "code": "",
                "short_name": "Short",
                "top_players": \(stubbedPlayerJson)
            }
        """.data(using: .utf8)!

        let team = try? JSONDecoder().decode(Team.self, from: jsonData)
        XCTAssert(team?.topPlayers.count == 2, "Incorrect number of topPlayers for team")
    }

    func testTopPlayersEmpty_GivenNoTopPlayers() {
        let jsonData = """
            {
            "id": 1,
            "name": "",
            "code": "",
            "short_name": "Short",
            "top_players": []
            }
            """.data(using: .utf8)!

        let team = try? JSONDecoder().decode(Team.self, from: jsonData)
        XCTAssert(team?.topPlayers.isEmpty == true, "Incorrect number of topPlayers for team")
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

        XCTAssertThrowsError(try JSONDecoder().decode(Team.self, from: jsonData))
    }

    func testThrowsError_GivenMissingElementInJsonData() {
        let jsonData = """
            {
                "id": 23,
                "name": "",
                "code": "",
                "short_name": ""
            }
        """.data(using: .utf8)!

        XCTAssertThrowsError(try JSONDecoder().decode(Team.self, from: jsonData))
    }
}
