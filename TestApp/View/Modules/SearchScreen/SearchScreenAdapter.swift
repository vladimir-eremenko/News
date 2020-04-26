//
//  SearchScreenAdapter.swift
//  TestApp
//
//  Created by vladimir on 22.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
import UIKit

final class SearchScreenAdapter: NSObject {
    
    private var dataSource: [News] = []
    weak var collectionView: UICollectionView? {
        didSet {
            self.collectionView?.register(UINib(nibName: NewsCollectionCell.identifier, bundle: nil), forCellWithReuseIdentifier: NewsCollectionCell.identifier)
            self.collectionView?.allowsSelection = false
            self.collectionView?.dataSource = self
            self.collectionView?.collectionViewLayout = NewsCollectionViewLayout()
            self.collectionView?.reloadData()
        }
    }
    
    weak var searchBar: UISearchBar? {
        didSet {
            self.searchBar?.delegate = self
        }
    }
    
    var isEditingMode: Bool = false {
        didSet {
            self.collectionView?.reloadData()
        }
    }
    
    func reloadData(dataSource: [News]) {
        self.dataSource = dataSource
        self.collectionView?.reloadData()
    }
}

extension SearchScreenAdapter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionCell.identifier, for: indexPath) as! NewsCollectionCell
        let news = self.dataSource[indexPath.row]
        cell.item = news
        return cell
    }
}

extension SearchScreenAdapter: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        NotificationCenter.default.post(name: .searchTapped, object: nil)
    }
}
