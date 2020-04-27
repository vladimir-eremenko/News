//
//  SearchScreenPresenter.swift
//  TestApp
//
//  Created by vladimir on 27.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
import UIKit

final class SearchScreenPresenter {
    
    private weak var view: SearchScreenViewInput!
    private var dataSource: [News] = []
    
    init(view: SearchScreenViewInput) {
        self.view = view
    }
}

extension SearchScreenPresenter: SearchScreenModuleInput {
    func toPresent() -> UIViewController? {
        return self.view as? UIViewController
    }
}

extension SearchScreenPresenter: SearchScreenViewOutput {
    func viewDidLoad() {
        self.view.showNews([])
    }
}

//extension SearchScreenPresenter: SourceListAdapterDelegate {
//
//}
