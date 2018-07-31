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
        print("NumberOfSections:: \(viewModel.numberOfSections)")
        return viewModel.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("NumberOfRowsInSection \(section):: \(viewModel.numberOfRowsInSection(section: section))")
        return viewModel.numberOfRowsInSection(section: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create cell PlayerStatsTableViewCell()
        // cell.configure()
        return UITableViewCell()
    }

}

