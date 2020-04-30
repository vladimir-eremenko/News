//
//  NewsListViewControlller.swift
//  TestApp
//
//  Created by vladimir on 30.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
import UIKit

class NewsListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var adapter : NewsListAdapter!
    var output: NewsListViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.adapter.collectionView = self.collectionView
        self.output.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(backTapped))
    }
    
    @objc func backTapped() {
        self.output.navBarButtonTapped()
    }
}

extension NewsListViewController: NewsListViewInput {
    func showNews(_ list: [NewsCollectionCell.NewsDisplayItem]) {
        self.adapter.reloadData(dataSource: list)
    }
}
