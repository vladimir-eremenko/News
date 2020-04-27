//
//  SourceListAdapter.swift
//  TestApp
//
//  Created by vladimir on 20.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
import UIKit

protocol SourceListAdapterDelegate: AnyObject {
    func addToFavoriteSourceWithIndex(index: Int)
}

final class SourceListAdapter: NSObject {
    
    private var dataSource: [SourceCell.SourceDisplayItem] = []
    weak var delegate: SourceListAdapterDelegate?
    
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
    
    func reloadData(dataSource: [SourceCell.SourceDisplayItem]) {
        self.dataSource = dataSource
        self.tableView?.reloadData()
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

extension SourceListAdapter: SourceCellDelegate {
    func sourceCellFavoriteTapped(_ sourceCell: SourceCell, subscribeButtonTappedFor item: SourceCell.SourceDisplayItem) {
        
        guard let index = self.tableView?.indexPath(for: sourceCell)?.row else {return}
        
        self.delegate?.addToFavoriteSourceWithIndex(index: index)
    }
}
