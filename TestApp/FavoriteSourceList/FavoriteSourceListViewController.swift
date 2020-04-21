//
//  SecondViewController.swift
//  TestApp
//
//  Created by vladimir on 15.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import UIKit

class FavoriteSourceListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var adapter : FavoriteSourceListAdapter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(dataSourceChanged), name: .favoriteSourceAdded, object: nil)
        
        self.adapter = FavoriteSourceListAdapter()
        self.adapter.tableView = self.tableView
        self.adapter.reloadData(dataSource: DataService.shared.favoriteSources)
    }
    
    @objc func dataSourceChanged() {
        self.adapter.reloadData(dataSource: DataService.shared.favoriteSources)
    }
}

