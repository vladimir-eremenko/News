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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.adapter = SearchScreenAdapter()
        self.adapter.collectionView = self.collectionView
        self.adapter.searchBar = self.searchBar
        
        NotificationCenter.default.addObserver(self, selector: #selector(searchAction), name: .searchTapped, object: nil)
        
    }
    
    @objc func searchAction() {
        guard let searchText = searchBar.text else {return}
        DataService.shared.searchNewsForString(searchString: searchText, completion: { [weak weakSelf = self] (result) in
                   switch result {
                       case .failure(let error) :
                           print("\(error)")

                       case .success(let result) :
                           weakSelf?.adapter.reloadData(dataSource: result)
                   }
               })
    }
}
