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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
