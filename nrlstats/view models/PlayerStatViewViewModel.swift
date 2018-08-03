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

    // MARK: - Properties

    var player: Player

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

    init(player: Player, networkManager: NetworkManagerProtocol) {
        self.player = player
        self.networkManager = networkManager
    }

    func load() {
        shortName = player.shortName
        jumperNumber = "\(player.jumperNumber)"
        position = player.position
        statValue = "\(player.statValue)"
        getPlayerHeadshotData()
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
