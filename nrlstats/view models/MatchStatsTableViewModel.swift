//
//  MatchStatsTableViewModel.swift
//  nrlstats
//
//  Created by Marc O'Neill on 31/07/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import Foundation

class MatchStatsTableViewModel {

    // MARK: - Properties

    var networkManager: NetworkManagerProtocol!

    var matchStats: [MatchStat]? {
        didSet {
            self.onModelChange?()
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
}
