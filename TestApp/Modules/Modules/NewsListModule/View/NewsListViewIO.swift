//
//  NewsListViewIO.swift
//  TestApp
//
//  Created by vladimir on 30.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
protocol NewsListViewInput: AnyObject {
    func showNews(_ list: [NewsCollectionCell.NewsDisplayItem])
    func showBusy()
    func showReady()
}

protocol NewsListViewOutput: AnyObject {
    func viewDidLoad()
    func navBarButtonTapped()
}
