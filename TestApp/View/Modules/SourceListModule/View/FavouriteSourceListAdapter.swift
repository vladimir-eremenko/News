//
//  FavouriteSourceListAdapter.swift
//  TestApp
//
//  Created by vladimir on 28.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
import UIKit

final class FavouriteSourceListAdapter : SourceListAdapter {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
          switch editingStyle {
          case .delete:
                self.delegate?.removeFavoriteSourceWithIndex(index: indexPath.row)
                self.dataSource.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
          case .insert, .none:
              break
          @unknown default:
              fatalError("UITableView commit editingStyle issue!")
          }
    }
    
}
