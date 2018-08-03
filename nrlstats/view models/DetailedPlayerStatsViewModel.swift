//
//  DetailedPlayerStatsViewModel.swift
//  nrlstats
//
//  Created by Marc O'Neill on 03/08/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import Foundation

struct DetailedPlayerStatsViewModel {

    // MARK: - Private Properties
    private var player: Player

    var imageData: Data? {
        didSet {
            player.imageData = imageData
            onImageDataChange?()
        }
    }

    var fullName: String {
        didSet {
            onFullNameChange?()
        }
    }

    var position: String {
        didSet {
            onPositionChange?()
        }
    }

    var onImageDataChange: (() -> Void)?
    var onFullNameChange: (() -> Void)?
    var onPositionChange: (() -> Void)?

    init(player: Player) {
        self.player = player
        self.imageData = player.imageData
        self.fullName = player.fullName
        self.position = player.position
    }

    func viewModelForCell(at indexPath: IndexPath) -> StatCellViewModel {

        return StatCellViewModel()
    }
    
}
