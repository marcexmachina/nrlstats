//
//  PlayerStatsTableViewCellModel.swift
//  nrlstats
//
//  Created by Marc O'Neill on 01/08/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import Foundation

class PlayerStatsTableViewCellModel {

    // MARK: - Properties
    var playerA: Player?
    var playerB: Player?

    init(playerA: Player, playerB: Player) {
        self.playerA = playerA
        self.playerB = playerB
    }

    // MARK: - Methods

    func playerAStatViewModel() -> PlayerStatViewViewModel? {
        guard let playerA = playerA else {
            return nil
        }
        return PlayerStatViewViewModel(player: playerA)
    }

    func playerBStatViewModel() -> PlayerStatViewViewModel? {
        guard let playerB = playerB else {
            return nil
        }
        return PlayerStatViewViewModel(player: playerB)
    }
}
