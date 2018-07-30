//
//  Team.swift
//  nrlstats
//
//  Created by Marc O'Neill on 30/07/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import Foundation

struct Team: Decodable {
    let id: Int
    let name: String
    let code: String
    let shortName: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case code
        case shortName = "short_name"
    }
}
