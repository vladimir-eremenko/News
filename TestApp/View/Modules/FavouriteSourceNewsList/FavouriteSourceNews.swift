//
//  FavouriteSourceNews.swift
//  TestApp
//
//  Created by vladimir on 23.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
import UIKit

class FavouriteSourceNewsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var adapter : SearchScreenAdapter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.adapter = SearchScreenAdapter()
        self.adapter.collectionView = self.collectionView
        
        DataService.shared.newsOfFavourite {[weak weakSelf = self] (result) in
            switch result {
                case .failure(let error) :
                    print("\(error)")

                case .success(let result) :
                    weakSelf?.adapter.reloadData(dataSource: result)
            }
        }
    }
}
