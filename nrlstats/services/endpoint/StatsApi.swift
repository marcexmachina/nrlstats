//
//  MatchStatsApi.swift
//  nrlstats
//
//  Created by Marc O'Neill on 31/07/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import Foundation

public enum StatsApi: EndpointType {
    case matchStats(match: String)
    case playerStats(teamId: Int, playerId: Int)

    var baseUrl: URL {
        guard let url = URL(string: "https://statsapi.foxsports.com.au/3.0/api/sports/league/") else { fatalError("baseURL could not be configured.") }
        return url
    }

    var path: String {
        switch self {
        case .matchStats(let match):
            return "matches/\(match)/topplayerstats.json;type=fantasy_points;type=tackles;type=runs;type=run_metres?limit=5&userkey=A00239D3-45F6-4A0A-810C-54A347F144C2"
        case .playerStats(let teamId, let playerId):
            return "series/1/seasons/115/teams/\(teamId)/players/\(playerId)/detailedstats.json?&userkey=9024ec15-d791-4bfd-aa3b-5bcf5d36da4f"
        }
    }

    var httpMethod: HTTPMethod {
        return .get
    }

    var task: HTTPTask {
        return .request
    }
}
