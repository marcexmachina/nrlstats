//
//  MatchStatTests.swift
//  nrlstatsTests
//
//  Created by Marc O'Neill on 30/07/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import XCTest
@testable import nrlstats

class MatchStatTests: XCTestCase {

    func testMatchId_GivenJsonData() {
        let jsonData = """
            {
                "match_id": "NRL1",
                "team_A": {
                    "id": 0,
                    "name": "",
                    "code": "",
                    "short_name": "",
                    "top_players": []
                },
                "team_B": {
                    "id": 1,
                    "name": "",
                    "code": "",
                    "short_name": "",
                    "top_players": []
                },
                "stat_type": ""
             }
        """.data(using: .utf8)!

        let matchStat = try? JSONDecoder().decode(MatchStat.self, from: jsonData)
        XCTAssert(matchStat?.matchId == "NRL1", "Incorrect matchId for matchStat")
    }

    func testTeamA_GivenJsonData() {
        let jsonData = """
            {
                "match_id": "",
                "team_A": {
                    "id": 0,
                    "name": "TeamA",
                    "code": "",
                    "short_name": "",
                    "top_players": []
                },
                "team_B": {
                    "id": 1,
                    "name": "",
                    "code": "",
                    "short_name": "",
                    "top_players": []
                },
                "stat_type": ""
             }
        """.data(using: .utf8)!

        let matchStat = try? JSONDecoder().decode(MatchStat.self, from: jsonData)
        XCTAssert(matchStat?.teamA.name == "TeamA", "Incorrect teamName for teamA")
    }

    func testTeamB_GivenJsonData() {
        let jsonData = """
            {
                "match_id": "",
                "team_A": {
                    "id": 0,
                    "name": "TeamA",
                    "code": "",
                    "short_name": "",
                    "top_players": []
                },
                "team_B": {
                    "id": 1,
                    "name": "TeamB",
                    "code": "",
                    "short_name": "",
                    "top_players": []
                },
                "stat_type": ""
             }
        """.data(using: .utf8)!

        let matchStat = try? JSONDecoder().decode(MatchStat.self, from: jsonData)
        XCTAssert(matchStat?.teamB.name == "TeamB", "Incorrect teamName for teamB")
    }

    func testStatType_GivenJsonData() {
        let jsonData = """
            {
                "match_id": "",
                "team_A": {
                    "id": 0,
                    "name": "",
                    "code": "",
                    "short_name": "",
                    "top_players": []
                },
                "team_B": {
                    "id": 1,
                    "name": "",
                    "code": "",
                    "short_name": "",
                    "top_players": []
                },
                "stat_type": "run_metres"
             }
        """.data(using: .utf8)!

        let matchStat = try? JSONDecoder().decode(MatchStat.self, from: jsonData)
        XCTAssert(matchStat?.statType == "run_metres", "Incorrect statType for matchStat")
    } 
}
