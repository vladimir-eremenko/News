//
//  FavoriteSourceListAdapter.swift
//  TestApp
//
//  Created by vladimir on 21.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
import UIKit

final class FavoriteSourceListAdapter: NSObject {
    
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
    
    func removeItem(at index: Int) {
        let source = dataSource[index]
        dataSource.remove(at: index)
        DataService.shared.removeFavorite(source: source)
        NotificationCenter.default.post(name: .favoriteSourceRemoved, object: nil)
    }
}

extension FavoriteSourceListAdapter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SourceCell.identifier, for: indexPath) as! SourceCell
        let displayItem = self.dataSource[indexPath.row]
        cell.item = displayItem
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
          switch editingStyle {
          case .delete:
            self.removeItem(at: indexPath.row)
              tableView.deleteRows(at: [indexPath], with: .fade)
          case .insert, .none:
              break
          @unknown default:
              fatalError("UITableView commit editingStyle issue!")
          }
    }
}
