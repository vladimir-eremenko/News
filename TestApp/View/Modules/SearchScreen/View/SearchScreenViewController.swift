//
//  SearchScreenViewController.swift
//  TestApp
//
//  Created by vladimir on 22.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
import UIKit

class SearchScreenViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var adapter : SearchScreenAdapter!
    var output: SearchScreenViewOutput!
    
    lazy var searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.searchResultsUpdater = self.adapter
        
        controller.obscuresBackgroundDuringPresentation = false
        controller.searchBar.placeholder = "Search for news..."
        controller.searchBar.sizeToFit()
        controller.searchBar.searchBarStyle = .default
        
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.adapter.collectionView = self.collectionView
        self.output.viewDidLoad()
        navigationItem.searchController = searchController
    }
}

extension SearchScreenViewController: SearchScreenViewInput {
    func showNews(_ list: [NewsCollectionCell.NewsDisplayItem]) {
        self.adapter.reloadData(dataSource: list)
    }
}
