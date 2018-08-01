//
//  ViewController.swift
//  nrlstats
//
//  Created by Marc O'Neill on 28/07/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import UIKit

class TeamComparisonTableViewController: UITableViewController {

    // MARK: - Private properties

    lazy private var viewModel: MatchStatsTableViewModel = {
        return MatchStatsTableViewModel(networkManager: NetworkManager(session: URLSession.shared))
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "PlayerStatsTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        setupBindings()
        viewModel.load()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Private methods

    private func setupBindings() {
        viewModel.onModelChange = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    // MARK: -  UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? PlayerStatsTableViewCell else {
            return UITableViewCell()
        }
        cell.viewModel = viewModel.viewModelForCell(at: indexPath)
        cell.configure()
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

