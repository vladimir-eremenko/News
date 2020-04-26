//
//  FirstViewController.swift
//  TestApp
//
//  Created by vladimir on 15.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import UIKit

class SourceListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var output: SourceListViewOutput!
    var adapter : SourceListAdapter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.adapter.tableView = self.tableView
        self.output.viewDidLoad()
    }
}

extension SourceListViewController: SourceListViewInput {
    func showSources(_ list: [SourceCell.SourceDisplayItem]) {
        self.adapter.reloadData(dataSource: list)
    }
}

