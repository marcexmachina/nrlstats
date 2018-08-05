//
//  DetailHeaderView.swift
//  nrlstats
//
//  Created by Marc O'Neill on 03/08/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import UIKit

class DetailHeaderView: UIView {

    @IBOutlet weak var headshotImageView: UIImageView!
    @IBOutlet weak var nameValueLabel: UILabel!
    @IBOutlet weak var positionValueLabel: UILabel!
    @IBOutlet var contentView: UIView!

    // MARK: - Properties

    var viewModel: DetailHeaderViewViewModel? {
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
        Bundle.main.loadNibNamed("DetailHeaderView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

    private func bind() {
        viewModel?.onImageDataChange = { [weak self] in
            guard let data = self?.viewModel?.imageData else { return }
            self?.headshotImageView.image = UIImage(data: data)
        }

        viewModel?.onFullNameChange = { [weak self] in
            self?.nameValueLabel.text = self?.viewModel?.fullName
        }

        viewModel?.onPositionChange = { [weak self] in
            self?.positionValueLabel.text = self?.viewModel?.position
        }
    }
}
