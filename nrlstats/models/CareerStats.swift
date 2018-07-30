//
//  CareerStats.swift
//  nrlstats
//
//  Created by Marc O'Neill on 30/07/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import Foundation

struct CareerStats: Decodable {
    let games: Int
    let points: Int
    let tries: Int
    let winPercentage: Double

    enum CodingKeys: String, CodingKey {
        case games
        case points
        case tries
        case winPercentage = "win_percentage"
    }
}
