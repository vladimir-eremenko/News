//
//  FirstViewController.swift
//  TestApp
//
//  Created by vladimir on 15.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import UIKit
import SwiftSpinner

class SourceListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var output: SourceListViewOutput!
    var adapter : SourceListAdapter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.adapter.tableView = self.tableView
        self.output.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.output.viewWillAppear()
        super.viewWillAppear(animated)
    }
}

extension SourceListViewController: SourceListViewInput {
    func showSources(_ list: [SourceCell.SourceDisplayItem]) {
        self.adapter.reloadData(dataSource: list)
    }
    
    func showBusy(){
        SwiftSpinner.show("Loading")
    }
    
    func showReady(){
        SwiftSpinner.hide()
    }
}
