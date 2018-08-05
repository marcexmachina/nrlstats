//
//  DetailHeaderViewViewModel.swift
//  nrlstats
//
//  Created by Marc O'Neill on 03/08/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import Foundation

class DetailHeaderViewViewModel {

    // MARK: - Private Properties

    private var player: Player

    // MARK: - Properties

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

    // MARK: - Lifecycle

    init(player: Player) {
        self.player = player
        self.fullName = player.fullName
        self.position = player.position
    }

    // MARK: - Methods

    func load() {
        imageData = player.imageData
        fullName = player.fullName
        position = player.position
    }
}
