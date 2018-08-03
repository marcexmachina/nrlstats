//
//  PlayerStatView.swift
//  nrlstats
//
//  Created by Marc O'Neill on 31/07/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import UIKit

class PlayerStatView: UIView {

    @IBOutlet weak var headshotImageView: UIImageView! {
        didSet {
            headshotImageView.isUserInteractionEnabled = true
        }
    }

    @IBOutlet weak var nameValueLabel: UILabel!
    @IBOutlet weak var numberValueLabel: UILabel!
    @IBOutlet weak var positionValueLabel: UILabel!
    @IBOutlet weak var statValueLabel: UILabel!
    @IBOutlet var playerStatView: UIView!

    // MARK: - Properties

    weak var tapDelegate: ImageTapDelegate?

    var viewModel: PlayerStatViewViewModel? {
        didSet {
            bind()
            viewModel?.load()
        }
    }

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    // MARK: - Private Methods

    private func commonInit() {
        Bundle.main.loadNibNamed("PlayerStatView", owner: self, options: nil)
        addSubview(playerStatView)
        playerStatView.frame = self.bounds
        playerStatView.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        headshotImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(PlayerStatView.imageTapped)))
    }

    private func bind() {
        viewModel?.onShortNameChange = { [weak self] in
            self?.nameValueLabel.text = self?.viewModel?.shortName
        }

        viewModel?.onJumperNumberChange = { [weak self] in
            self?.numberValueLabel.text = self?.viewModel?.jumperNumber
        }

        viewModel?.onPositionChange = { [weak self] in
            self?.positionValueLabel.text = self?.viewModel?.position
        }

        viewModel?.onStatValueChange = { [weak self] in
            self?.statValueLabel.text = self?.viewModel?.statValue
        }

        viewModel?.onImageDataChange = { [weak self] in
            guard let data = self?.viewModel?.imageData else { return }
            DispatchQueue.main.async {
                self?.headshotImageView.image = UIImage(data: data)
            }
        }
    }

    @objc private func imageTapped() {
        tapDelegate?.didTapImageIn(statView: self)
    }
}
