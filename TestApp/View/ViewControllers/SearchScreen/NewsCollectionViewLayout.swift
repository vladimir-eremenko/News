//
//  NewsCollectionViewLayout.swift
//  TestApp
//
//  Created by vladimir on 22.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
import Foundation
import UIKit

class NewsCollectionViewLayout : UICollectionViewFlowLayout {

    override init() {
        super.init()

        self.minimumLineSpacing = 10
        self.minimumInteritemSpacing = 10
        self.configLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configLayout() {
            self.scrollDirection = .vertical
            if let collectionView = self.collectionView {
                self.itemSize = CGSize(width: collectionView.frame.width * 0.9, height: collectionView.frame.height * 0.3)
            }
    }

    override func invalidateLayout() {
        super.invalidateLayout()
        self.configLayout()
    }
}
