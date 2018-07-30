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
    let position: String
    let fullName: String
    let shortName: String
    let statValue: Int
    let jumperNumber: Int

    enum CodingKeys: String, CodingKey {
        case id
        case position
        case fullName = "full_name"
        case shortName = "short_name"
        case statValue = "stat_value"
        case jumperNumber = "jumper_number"
    }
}
