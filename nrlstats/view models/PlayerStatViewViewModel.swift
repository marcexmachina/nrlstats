//
//  PlayerStatViewViewModel.swift
//  nrlstats
//
//  Created by Marc O'Neill on 01/08/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import Foundation

struct PlayerStatViewViewModel {
    var player: Player

    var shortName: String {
        return player.shortName
    }

    var jumperNumber: String {
        return "\(player.jumperNumber)"
    }

    var position: String {
        return player.position
    }

    var statValue: String {
        return "\(player.statValue)"
    }
}
