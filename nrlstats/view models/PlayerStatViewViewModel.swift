//
//  PlayerStatViewViewModel.swift
//  nrlstats
//
//  Created by Marc O'Neill on 01/08/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import Foundation

class PlayerStatViewViewModel {

    // MARK: - Private Properties

    private var networkManager: NetworkManagerProtocol
    private var player: Player

    // MARK: - Properties

    var shortName: String? {
        didSet {
            onShortNameChange?()
        }
    }

    var jumperNumber: String? {
        didSet {
            onJumperNumberChange?()
        }
    }

    var position: String? {
        didSet {
            onPositionChange?()
        }
    }

    var statValue: String? {
        didSet {
            onStatValueChange?()
        }
    }

    var imageData: Data? {
        didSet {
            player.imageData = imageData
            onImageDataChange?()
        }
    }

    var onShortNameChange: (() -> Void)?
    var onJumperNumberChange: (() -> Void)?
    var onPositionChange: (() -> Void)?
    var onStatValueChange: (() -> Void)?
    var onImageDataChange: (() -> Void)?

    var fetchError: String?

    // MARK: - Lifecycle

    init(player: Player, networkManager: NetworkManagerProtocol) {
        self.player = player
        self.networkManager = networkManager
    }

    // MARK: - Methods

    func load() {
        shortName = player.shortName
        jumperNumber = "\(player.jumperNumber ?? 0)"
        position = player.position
        statValue = "\(player.statValue ?? 0)"
        getPlayerHeadshotData()
    }

    func detailedPlayerStatsViewModel() -> DetailedPlayerStatsViewModel {
        return DetailedPlayerStatsViewModel(player: player, networkManager: networkManager)
    }

    // MARK: - Private Methods

    private func getPlayerHeadshotData() {
        networkManager.getPlayerImageData(playerId: player.id) { [weak self] data, error in
            guard let data = data else {
                self?.fetchError = error
                return
            }
            self?.imageData = data
        }
    }
}
