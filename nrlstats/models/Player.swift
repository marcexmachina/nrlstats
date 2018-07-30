//
//  Player.swift
//  nrlstats
//
//  Created by Marc O'Neill on 30/07/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import Foundation

struct Player: Decodable {
    let id: Int
    let surname: String?
    let position: String
    let fullName: String
    let shortName: String
    let dateOfBirth: String?
    let heightCm: Int?
    let otherNames: String?
    let weightKg: Int?
    let lastMatchId: String?
    let careerStats: CareerStats?
    let lastMatchStats: LastMatchStats?
    let seriesSeasonStats: SeriesSeasonStats?
    let statValue: Int
    let jumperNumber: Int

    enum CodingKeys: String, CodingKey {
        case id
        case surname
        case position
        case fullName = "full_name"
        case shortName = "short_name"
        case dateOfBirth = "date_of_birth"
        case heightCm = "height_cm"
        case otherNames = "other_names"
        case weightKg = "weight_kg"
        case lastMatchId = "last_match_id"
        case careerStats = "career_stats"
        case lastMatchStats = "last_match_stats"
        case seriesSeasonStats = "series_season_stats"
        case statValue = "stat_value"
        case jumperNumber = "jumper_number"
    }
}
