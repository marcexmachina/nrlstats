//
//  PlayerStatsTableViewCellModel.swift
//  nrlstats
//
//  Created by Marc O'Neill on 01/08/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import Foundation

class PlayerStatsTableViewCellViewModel {

    // MARK: - Properties
    
    var playerA: Player?
    var playerB: Player?
    var networkManager: NetworkManagerProtocol

    init(playerA: Player, playerB: Player, networkManager: NetworkManagerProtocol) {
        self.playerA = playerA
        self.playerB = playerB
        self.networkManager = networkManager
    }

    // MARK: - Methods

    func playerAStatViewModel() -> PlayerStatViewViewModel? {
        guard let playerA = playerA else {
            return nil
        }
        return PlayerStatViewViewModel(player: playerA, networkManager: networkManager)
    }

    func playerBStatViewModel() -> PlayerStatViewViewModel? {
        guard let playerB = playerB else {
            return nil
        }
        return PlayerStatViewViewModel(player: playerB, networkManager: networkManager)
    }
}
