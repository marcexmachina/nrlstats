//
//  PlayerStatsTableViewCell.swift
//  nrlstats
//
//  Created by Marc O'Neill on 31/07/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import UIKit

class PlayerStatsTableViewCell: UITableViewCell {
    @IBOutlet weak var playerAStatView: PlayerStatView!
    @IBOutlet weak var playerBStatView: PlayerStatView!

    weak var tapDelegate: ImageTapDelegate?

    func configure(viewModel: PlayerStatsTableViewCellModel, tapDelegate: ImageTapDelegate) {
        self.tapDelegate = tapDelegate
        playerAStatView.viewModel = viewModel.playerAStatViewModel()
        playerBStatView.viewModel = viewModel.playerBStatViewModel()
        playerAStatView.tapDelegate = tapDelegate
        playerBStatView.tapDelegate = tapDelegate
    }
    
}
