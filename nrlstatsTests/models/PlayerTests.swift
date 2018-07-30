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

    func testSurname_GivenJsonData() {
        let jsonData = """
            {
                  "id": 23,
                  "surname": "Player",
                  "position": "",
                  "full_name": "",
                  "short_name": "",
                  "stat_value": 0,
                  "jumper_number": 7
            }
        """.data(using: .utf8)!

        let player = try? JSONDecoder().decode(Player.self, from: jsonData)
        XCTAssert(player?.surname == "Player", "Incorrect surname for player")
    }

    func testDateOfBirth_GivenJsonData() {
        let jsonData = """
            {
                  "id": 23,
                  "position": "",
                  "full_name": "",
                  "date_of_birth": "1988-12-13",
                  "short_name": "",
                  "stat_value": 0,
                  "jumper_number": 7
            }
        """.data(using: .utf8)!

        let player = try? JSONDecoder().decode(Player.self, from: jsonData)
        XCTAssert(player?.dateOfBirth == "1988-12-13", "Incorrect dateOfBirth for player")
    }

    func testHeightCm_GivenJsonData() {
        let jsonData = """
            {
                  "id": 23,
                  "position": "",
                  "full_name": "",
                  "height_cm": 183,
                  "short_name": "",
                  "stat_value": 0,
                  "jumper_number": 7
            }
        """.data(using: .utf8)!

        let player = try? JSONDecoder().decode(Player.self, from: jsonData)
        XCTAssert(player?.heightCm == 183, "Incorrect heightCm for player")
    }

    func testOtherNames_GivenJsonData() {
        let jsonData = """
            {
                  "id": 23,
                  "position": "",
                  "full_name": "",
                  "other_names": "Other",
                  "short_name": "",
                  "stat_value": 0,
                  "jumper_number": 7
            }
        """.data(using: .utf8)!

        let player = try? JSONDecoder().decode(Player.self, from: jsonData)
        XCTAssert(player?.otherNames == "Other", "Incorrect otherNames for player")
    }

    func testWeightKg_GivenJsonData() {
        let jsonData = """
            {
                  "id": 23,
                  "position": "",
                  "full_name": "",
                  "weight_kg": 99,
                  "short_name": "",
                  "stat_value": 0,
                  "jumper_number": 7
            }
        """.data(using: .utf8)!

        let player = try? JSONDecoder().decode(Player.self, from: jsonData)
        XCTAssert(player?.weightKg == 99, "Incorrect otherNames for player")
    }

    func testLastMatchId_GivenJsonData() {
        let jsonData = """
            {
                  "id": 23,
                  "position": "",
                  "full_name": "",
                  "last_match_id": "NRL1",
                  "short_name": "",
                  "stat_value": 0,
                  "jumper_number": 7
            }
        """.data(using: .utf8)!

        let player = try? JSONDecoder().decode(Player.self, from: jsonData)
        XCTAssert(player?.lastMatchId == "NRL1", "Incorrect lastMatchId for player")
    }

    func testCareerStats_GivenJsonData() {
        let stats = """
            {
                "games": 0,
                "points": 0,
                "tries": 0,
                "win_percentage": 55.3
            }
        """

        let jsonData = """
            {
                  "id": 23,
                  "position": "",
                  "full_name": "",
                  "career_stats": \(stats),
                  "short_name": "",
                  "stat_value": 0,
                  "jumper_number": 7
            }
        """.data(using: .utf8)!

        let player = try? JSONDecoder().decode(Player.self, from: jsonData)
        XCTAssertNotNil(player?.careerStats, "Career stats is nil")
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
