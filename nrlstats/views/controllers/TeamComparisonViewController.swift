//
//  ViewController.swift
//  nrlstats
//
//  Created by Marc O'Neill on 28/07/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import UIKit

class TeamComparisonTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: -  UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        // return viewModel.numberOfSections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return viewModel.numberOfRowsInSection(_ section: Int)
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create cell PlayerStatsTableViewCell()
        // cell.configure()
        return UITableViewCell()
    }

}

