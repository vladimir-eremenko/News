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
    @IBOutlet weak var searchBar: UISearchBar!
    
    var adapter : SearchScreenAdapter!
    var output: SearchScreenViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.adapter.collectionView = self.collectionView
        self.adapter.searchBar = self.searchBar
        self.output.viewDidLoad()
    }
}

extension SearchScreenViewController: SearchScreenViewInput {
    func showNews(_ list: [NewsCollectionCell.NewsDisplayItem]) {
        self.adapter.reloadData(dataSource: list)
    }
}
