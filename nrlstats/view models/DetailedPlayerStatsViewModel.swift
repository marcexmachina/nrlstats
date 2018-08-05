//
//  DetailedPlayerStatsViewModel.swift
//  nrlstats
//
//  Created by Marc O'Neill on 03/08/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import Foundation

class DetailedPlayerStatsViewModel {

    // MARK: - Private Properties

    private var networkManager: NetworkManagerProtocol

    private var player: Player {
        didSet {
            onModelChange?()
        }
    }

    var onModelChange: (() -> Void)?
    var fetchError: String? = nil
    var numberOfSections: Int = 1

    init(player: Player, networkManager: NetworkManagerProtocol) {
        self.player = player
        self.networkManager = networkManager
    }

    func load() {
        guard let teamId = player.teamId else { return }

        networkManager.getPlayerStats(teamId: teamId, playerId: player.id) { [weak self] player, error in
            guard let player = player else {
                self?.fetchError = error
                return
            }
            self?.player = player
        }
    }

    func viewModelForHeaderView() -> DetailHeaderViewViewModel {
        return DetailHeaderViewViewModel(player: player)
    }

    func numberOfRowsInSection(section: Int) -> Int {
        return player.lastMatchStats?.matchStats.count ?? 0
    }

    func statTypeForCell(at indexPath: IndexPath) -> String {
        return player.lastMatchStats?.matchStats[indexPath.row].type
            .replacingOccurrences(of: "_", with: " ").uppercased() ?? ""
    }

    func statValueForCell(at indexPath: IndexPath) -> String {
        return player.lastMatchStats?.matchStats[indexPath.row].value ?? ""
    }
    
}
