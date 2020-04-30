//
//  SourceListViewIO.swift
//  TestApp
//
//  Created by vladimir on 24.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
protocol SourceListViewInput: AnyObject {
    func showSources(_ list: [SourceCell.SourceDisplayItem])
}

protocol SourceListViewOutput: AnyObject {
    func viewDidLoad()
    func navBarButtonTapped()
    func viewWillAppear()
}
