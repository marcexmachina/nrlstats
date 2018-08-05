//
//  DetailTableViewController.swift
//  nrlstats
//
//  Created by Marc O'Neill on 03/08/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    // MARK: - Properties
    var viewModel: DetailedPlayerStatsViewModel?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let headerView = DetailHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 300))
        headerView.viewModel = viewModel?.viewModelForHeaderView()
        tableView.tableHeaderView = headerView
        setupBindings()
        viewModel?.load()
    }

    // MARK: - Private methods

    private func setupBindings() {
        viewModel?.onModelChange = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.numberOfSections ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowsInSection(section: section) ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.statCellId, for: indexPath)
        cell.detailTextLabel?.text = viewModel?.statValueForCell(at: indexPath)
        cell.textLabel?.text = viewModel?.statTypeForCell(at: indexPath)
        return cell
    }
}
