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

    var adapter : SourceListAdapter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.adapter = SourceListAdapter()
        self.adapter.tableView = self.tableView
        
        NotificationCenter.default.addObserver(self, selector: #selector(dataSourceChanged), name: .favoriteSourceRemoved, object: nil)
        
        DataService.shared.fetchSources {[weak weakSelf = self] (result) in
            switch result {
                case .failure(let error) :
                    print("\(error)")

                case .success(let result) :
                    weakSelf?.adapter.reloadData(dataSource: result)
            }
        }
    }
    
    @objc func dataSourceChanged() {
           self.adapter.reloadData(dataSource: DataService.shared.sources)
    }
}

