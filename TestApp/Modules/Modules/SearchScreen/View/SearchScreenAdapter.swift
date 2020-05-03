//
//  SearchScreenAdapter.swift
//  TestApp
//
//  Created by vladimir on 22.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
import UIKit

protocol SearchScreenAdapterDelegate: AnyObject {
    func searchFor(text: String)
}

final class SearchScreenAdapter: NSObject {
    
    var timer: Timer?
    
    weak var delegate : SearchScreenAdapterDelegate?
    private var dataSource: [NewsCollectionCell.NewsDisplayItem] = []
    weak var collectionView: UICollectionView? {
        didSet {
            self.collectionView?.register(UINib(nibName: NewsCollectionCell.identifier, bundle: nil), forCellWithReuseIdentifier: NewsCollectionCell.identifier)
            self.collectionView?.allowsSelection = false
            self.collectionView?.dataSource = self
            self.collectionView?.collectionViewLayout = NewsCollectionViewLayout()
            self.collectionView?.reloadData()
        }
    }
    
    var isEditingMode: Bool = false {
        didSet {
            self.collectionView?.reloadData()
        }
    }
    
    func reloadData(dataSource: [NewsCollectionCell.NewsDisplayItem]) {
        self.collectionView?.setContentOffset(.zero, animated: true)
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

extension SearchScreenAdapter: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {return}
        if searchText.count == 0 {return}
        timer?.invalidate()  // Cancel any previous timer

        if searchText.count >= 2 {

             // …schedule a timer for 0.5 seconds
            timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: {[weak weakSelf = self] (timer) in
                weakSelf?.delegate?.searchFor(text: searchText)
            })
        }
    }
}
