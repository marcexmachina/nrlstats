//
//  Player_.swift
//  nrlstatsTests
//
//  Created by Marc O'Neill on 06/08/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import UIKit
@testable import nrlstats

extension Player {
    static func mock() -> Player {
        return Player(id: 1,
                      surname: "Player",
                      position: "Position",
                      fullName: "Test Player",
                      shortName: "T. Player",
                      dateOfBirth: "1/1/1990",
                      heightCm: 183,
                      otherNames: "Test",
                      weightKg: 70,
                      lastMatchId: "",
                      lastMatchStats: nil,
                      statValue: 1,
                      jumperNumber: 1,
                      imageData: UIImagePNGRepresentation(UIImage()),
                      teamId: 123)
    }
}
