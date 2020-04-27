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

extension SearchScreenPresenter: SearchScreenAdapterDelegate {
    func searchFor(text: String) {
        DataService.shared.searchNewsForString(searchString: text, completion: { [weak weakSelf = self] (result) in
                   switch result {
                       case .failure(let error) :
                           print("\(error)")

                       case .success(let result) :
                            
                           weakSelf?.dataSource = result
                           weakSelf?.view.showNews(self.dataSource.map({
                            return NewsCollectionCell.NewsDisplayItem(title: $0.title, newsDesc: $0.newsDesc, imgUrl: $0.urlToImage)
                           }))
                   }
               })
    }
}
