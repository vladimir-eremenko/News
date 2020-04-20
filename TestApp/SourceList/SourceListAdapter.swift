//
//  SourceListAdapter.swift
//  TestApp
//
//  Created by vladimir on 20.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
import UIKit
//protocol SourceListAdapterDelegate: AnyObject {
//    func shouldDeleteRow(at row: Int)
//}

final class SourceListAdapter: NSObject, SourceCellDelegate {
    
    private var dataSource: [Source] = []
    weak var tableView: UITableView? {
        didSet {
            self.tableView?.register(UINib(nibName: SourceCell.identifier, bundle: nil), forCellReuseIdentifier: SourceCell.identifier)
            self.tableView?.allowsSelection = false
            self.tableView?.dataSource = self
            self.tableView?.reloadData()
        }
    }
    
    var isEditingMode: Bool = false {
        didSet {
            self.tableView?.reloadData()
        }
    }
    
    func reloadData(dataSource: [Source]) {
        self.dataSource = dataSource
        self.tableView?.reloadData()
    }
    
    func sourceCellFavoriteTapped(_ sourceCell: SourceCell, subscribeButtonTappedFor item: Source) {
        item.isFavorite = true
    }
}

extension SourceListAdapter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SourceCell.identifier, for: indexPath) as! SourceCell
        let displayItem = self.dataSource[indexPath.row]
        cell.item = displayItem
        cell.delegate = self
        return cell
    }
}
