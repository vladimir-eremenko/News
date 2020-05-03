//
//  SearchListViewIO.swift
//  TestApp
//
//  Created by vladimir on 27.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
protocol SearchScreenViewInput: AnyObject {
    func showNews(_ list: [NewsCollectionCell.NewsDisplayItem])
    func showBusy()
    func showReady()
}

protocol SearchScreenViewOutput: AnyObject {
    func viewDidLoad()
}
