//
//  MatchStatsTableViewModel.swift
//  nrlstats
//
//  Created by Marc O'Neill on 31/07/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import Foundation

class MatchStatsTableViewModel {

    // MARK: - Private Properties

    private var networkManager: NetworkManagerProtocol

    // MARK: - Properties

    var matchStats: [MatchStat]? {
        didSet {
            onModelChange?()
        }
    }

    var numberOfSections: Int {
        return matchStats?.count ?? 0
    }

    var isLoading: Bool = false
    var onModelChange: (() -> Void)?
    var fetchError: String?

    // MARK: - Lifecycle

    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }

    // MARK: - Methods

    func load() {
        isLoading = true
        networkManager.getMatchStats(matchId: Constants.DefaultValues.matchId) { [weak self] matchStats, error in
            guard let matchStats = matchStats else {
                self?.fetchError = error
                return
            }
            self?.matchStats = matchStats
            self?.isLoading = false
        }
    }

    func numberOfRowsInSection(section: Int) -> Int {
        return matchStats?[section].teamA.topPlayers.count ?? 0 
    }

    func titleForHeaderInSection(section: Int) -> String {
        return matchStats?[section].statType.replacingOccurrences(of: "_", with: " ").uppercased() ?? ""
    }

    func viewModelForCell(at indexPath: IndexPath) -> PlayerStatsTableViewCellViewModel? {
        guard matchStats?[indexPath.section].teamA.topPlayers[indexPath.row] != nil, matchStats?[indexPath.section].teamB.topPlayers[indexPath.row] != nil else {
            return nil
        }
        var playerA = matchStats?[indexPath.section].teamA.topPlayers[indexPath.row]
        var playerB = matchStats?[indexPath.section].teamB.topPlayers[indexPath.row]

        // Safe to force unwrap here, have already guarded against nil above 
        playerA!.teamId = matchStats?[indexPath.section].teamA.id
        playerB!.teamId = matchStats?[indexPath.section].teamB.id
        return PlayerStatsTableViewCellViewModel(playerA: playerA!, playerB: playerB!, networkManager: networkManager)
    }
}
