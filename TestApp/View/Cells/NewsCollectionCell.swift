//
//  NewsCollectionCell.swift
//  TestApp
//
//  Created by vladimir on 22.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
import UIKit

class NewsCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var newsImage: UIImageView?
    @IBOutlet weak var newsTitle: UILabel?
    @IBOutlet weak var newsDescription: UILabel?
    
    var item: News? {
           didSet {
               guard let item = item else {
                   return
               }
               
            newsTitle?.text = item.title
            newsDescription?.text = item.newsDesc
            newsImage?.load(url: URL(string: item.urlToImage))
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

extension UIImageView {
    func load(url: URL?) {
        guard let imageURL = url else {return}
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: imageURL) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
