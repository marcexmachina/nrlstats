//
//  MatchStat.swift
//  nrlstats
//
//  Created by Marc O'Neill on 30/07/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import Foundation

struct MatchStat: Decodable {
    let matchId: String
    let teamA: Team
    let teamB: Team
    let statType: String

    enum CodingKeys: String, CodingKey {
        case matchId = "match_id"
        case teamA = "team_A"
        case teamB = "team_B"
        case statType = "stat_type"
    }
}
