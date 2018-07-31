//
//  PlayerStatView.swift
//  nrlstats
//
//  Created by Marc O'Neill on 31/07/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import UIKit

class PlayerStatView: UIView {
    @IBOutlet weak var headshotImageView: UIImageView!
    @IBOutlet weak var nameValueLabel: UILabel!
    @IBOutlet weak var numberValueLabel: UILabel!
    @IBOutlet weak var positionValueLabel: UILabel!
    @IBOutlet weak var statValueLabel: UILabel!
    @IBOutlet var playerStatView: UIView!
    
    var viewModel: PlayerStatViewViewModel! {
        didSet {
            nameValueLabel.text = viewModel.shortName
            numberValueLabel.text = viewModel.jumperNumber
            positionValueLabel.text = viewModel.position
            statValueLabel.text = viewModel.statValue
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        Bundle.main.loadNibNamed("PlayerStatView", owner: self, options: nil)
        addSubview(playerStatView)
        playerStatView.frame = self.bounds
        playerStatView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
