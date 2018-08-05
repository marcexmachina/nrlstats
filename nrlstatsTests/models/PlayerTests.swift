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
//        XCTAssertNotNil(player?.careerStats, "Career stats is nil")
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

    let fullJsonResponse = """
        {
        "id": 109705,
        "surname": "Tamou",
        "position": "Prop",
        "full_name": "James Tamou",
        "short_name": "J. Tamou",
        "date_of_birth": "1988-12-13",
        "height_cm": 195,
        "other_names": "James",
        "weight_kg": 114,
        "last_match_id": "NRL20182108",
        "career_stats": {
            "games": 215,
            "points": 64,
            "tries": 16,
            "win_percentage": 55.3
        },
        "last_match_stats": {
            "errors": 0,
            "goals": 0,
            "intercepted": 0,
            "intercepts": 0,
            "kicks": 0,
            "points": 0,
            "possessions": 0,
            "runs": 0,
            "tackles": 0,
            "tries": 0,
            "mins_played": 0,
            "attacking_kicks": 0,
            "bombs_caught": 0,
            "bombs_dropped": 0,
            "charged_down": 0,
            "charges_down": 0,
            "drop_outs": 0,
            "dummy_half_runs": 0,
            "effective_offloads": 0,
            "fantasy_points": 0,
            "field_goal_attempts": null,
            "field_goal_misses": 0,
            "field_goals": 0,
            "forced_drop_outs": 0,
            "general_play_pass": 0,
            "goal_misses": 0,
            "ineffective_tackles": 0,
            "in_goal_escapes": 0,
            "interchanges_off": 0,
            "interchanges_on": 0,
            "kick_errors": 0,
            "kick_metres": 0,
            "kick_return_metres": 0,
            "kick_returns": 0,
            "kicks_4020": 0,
            "kicks_dead": 0,
            "last_touch_try_assists": 0,
            "line_break_assists": 0,
            "line_break_causes": 0,
            "line_breaks": 0,
            "line_engagements": 0,
            "long_kicks": 0,
            "missed_tackles": 0,
            "off_loads": 0,
            "one_pass_runs": 0,
            "penalties_conceded": 0,
            "play_the_balls": 0,
            "run_metres": 0,
            "runs_7less_meters": null,
            "runs_8plus_meters": 0,
            "send_offs": 0,
            "sin_bins": 0,
            "steals_one_on_one": 0,
            "stolen_one_on_one": 0,
            "tackle_busts": 0,
            "tackled_opp20": 0,
            "tackle_opp_half": 0,
            "tackles_one_on_one": 0,
            "try_assists": 0,
            "try_causes": 0,
            "try_contribution_percentage": null,
            "try_contributions": 0,
            "try_involvements": 0,
            "twenty_metre_restarts": 0,
            "weighted_kicks": 0
        },
        "series_season_stats": {
            "games": 26,
            "wins": null,
            "draws": null,
            "losses": null,
            "tackles": 649,
            "errors": 12,
            "goals": 0,
            "intercepted": 0,
            "intercepts": 0,
            "kicks": 0,
            "points": 12,
            "possessions": 302,
            "runs": 284,
            "tries": 3,
            "minutes_played": 1182,
            "win_percentage": 53.8,
            "attacking_kicks": 0,
            "bombs_caught": 0,
            "bombs_dropped": 0,
            "charged_down": 0,
            "charges_down": 0,
            "drop_outs": 0,
            "dummy_half_runs": 2,
            "effective_offloads": 13,
            "fantasy_points": 1311,
            "field_goal_attempts": null,
            "field_goal_misses": 0,
            "field_goals": 0,
            "forced_drop_outs": 0,
            "general_play_pass": 29,
            "goal_misses": 0,
            "ineffective_tackles": 23,
            "in_goal_escapes": 0,
            "interchanges_off": 0,
            "interchanges_on": 0,
            "kick_errors": 0,
            "kick_metres": 0,
            "kick_return_metres": 0,
            "kick_returns": 0,
            "kicks_4020": 0,
            "kicks_dead": 0,
            "last_touch_try_assists": 0,
            "line_break_assists": 1,
            "line_break_causes": 9,
            "line_breaks": 4,
            "line_engagements": 4,
            "long_kicks": 0,
            "missed_tackles": 40,
            "off_loads": 18,
            "one_pass_runs": 192,
            "penalties_conceded": 12,
            "play_the_balls": 249,
            "run_metres": 2673,
            "runs_8plus_meters": 209,
            "runs_7less_meters": null,
            "send_offs": 0,
            "sin_bins": 0,
            "steals_one_on_one": 0,
            "stolen_one_on_one": 1,
            "tackle_busts": 48,
            "tackled_opp20": 74,
            "tackle_opp_half": 147,
            "tackles_one_on_one": 34,
            "try_assists": 0,
            "try_causes": 3,
            "try_contribution_percentage": null,
            "try_contributions": 0,
            "try_involvements": 3,
            "twenty_metre_restarts": 0,
            "weighted_kicks": 0
        }
    }
    """
}
