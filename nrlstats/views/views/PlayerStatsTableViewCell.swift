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

    var viewModel: PlayerStatsTableViewCellModel!

    func configure() {
        contentView.addSubview(playerAStatView)
        contentView.addSubview(playerBStatView)
        playerAStatView.translatesAutoresizingMaskIntoConstraints = false
        playerBStatView.translatesAutoresizingMaskIntoConstraints = false
        playerAStatView.viewModel = viewModel.playerAStatViewModel()
        playerBStatView.viewModel = viewModel.playerBStatViewModel()
    }
    
}
