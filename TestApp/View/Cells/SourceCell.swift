//
//  SourceCell.swift
//  TestApp
//
//  Created by vladimir on 20.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
import UIKit

protocol SourceCellDelegate: AnyObject {
  func sourceCellFavoriteTapped(_ sourceCell: SourceCell, subscribeButtonTappedFor item: Source)
}

class SourceCell : UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var favoriteButton : UIButton!
    
    weak var delegate : SourceCellDelegate?
    
    var item: Source? {
        didSet {
            guard let item = item else {
                return
            }
            
            nameLabel?.text = item.name
            descLabel?.text = item.sourceDesc
            favoriteButton.isEnabled = !item.isFavorite
        }
    }
    
    @IBAction func subscribeButtonTapped(_ sender: UIButton){
       // ask the delegate (in most case, its the view controller) to
       // call the function 'subscribeButtonTappedFor' on itself.
        self.favoriteButton.isEnabled = false
       if let item  = item, let delegate = delegate {
           delegate.sourceCellFavoriteTapped(self, subscribeButtonTappedFor: item)
       }
     }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
       
    static var identifier: String {
       return String(describing: self)
    }

    override func awakeFromNib() {
       super.awakeFromNib()
    }

    override func prepareForReuse() {
       super.prepareForReuse()
    }
}
