//
//  PlayerStatViewViewModel.swift
//  nrlstats
//
//  Created by Marc O'Neill on 01/08/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import Foundation

class PlayerStatViewViewModel {
    var player: Player

    var shortName: String? = nil {
        didSet {
            self.onShortNameChange?()
        }
    }

    var jumperNumber: String? {
        didSet {
            self.onJumperNumberChange?()
        }
    }

    var position: String? {
        didSet {
            self.onPositionChange?()
        }
    }

    var statValue: String? {
        didSet {
            self.onStatValueChange?()
        }
    }

    var onShortNameChange: (() -> Void)?
    var onJumperNumberChange: (() -> Void)?
    var onPositionChange: (() -> Void)?
    var onStatValueChange: (() -> Void)?

    init(player: Player) {
        self.player = player
    }

    func load() {
        shortName = player.shortName
        jumperNumber = "\(player.jumperNumber)"
        position = player.position
        statValue = "\(player.statValue)"
    }
}
