//
//  FavouriteSourceListViewController.swift
//  TestApp
//
//  Created by vladimir on 30.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
import UIKit

class FavouriteSourceListViewController: SourceListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "News", style: .done, target: self, action: #selector(newsTapped))
    }
    
    @objc func newsTapped() {
        self.output.navBarButtonTapped()
    }
}


