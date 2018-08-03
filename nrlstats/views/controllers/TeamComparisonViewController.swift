//
//  ViewController.swift
//  nrlstats
//
//  Created by Marc O'Neill on 28/07/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import UIKit

protocol ImageTapDelegate: class {
    func didTapImageIn(statView: PlayerStatView)
}

class TeamComparisonTableViewController: UITableViewController, ImageTapDelegate {

    // MARK: - Private properties

    lazy private var networkManager: NetworkManager = {
        return NetworkManager(session: URLSession.shared)
    }()

    lazy private var viewModel: MatchStatsTableViewModel = {
        return MatchStatsTableViewModel(networkManager: networkManager)
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "PlayerStatsTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        setupBindings()
        viewModel.load()
    }

    // MARK: - Private methods

    private func setupBindings() {
        viewModel.onModelChange = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }


    // MARK: - ImageTapDelegate

    func didTapImageIn(statView: PlayerStatView) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "DetailTableViewController") as? DetailTableViewController else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }

    // MARK: -  UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? PlayerStatsTableViewCell,
            let playerStatsViewModel = viewModel.viewModelForCell(at: indexPath)else {
            return UITableViewCell()
        }

        cell.configure(viewModel: playerStatsViewModel, tapDelegate: self)
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.titleForHeaderInSection(section: section)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

}

