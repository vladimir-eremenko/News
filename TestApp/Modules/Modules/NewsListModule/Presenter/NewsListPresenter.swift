//
//  NewsListPresenter.swift
//  TestApp
//
//  Created by vladimir on 30.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
import UIKit
import SCLAlertView

final class NewsListPresenter {
    
    private weak var view: NewsListViewInput!
    private var dataSource: [News] = []
    
    var finishFlow: EmptyCallback?
    
    init(view: NewsListViewInput) {
        self.view = view
    }
}

extension NewsListPresenter: NewsListModuleInput {
    func toPresent() -> UIViewController? {
        return self.view as? UIViewController
    }
}

extension NewsListPresenter: NewsListViewOutput {
    func viewDidLoad() {
        self.view.showBusy()
        DataService.shared.newsOfFavourite(completion : { [weak weakSelf = self]
            (result) in
            self.view.showReady()
                switch result {
                    case .failure(let error) :
                        SCLAlertView().showError("Error", subTitle: error.localizedDescription)

                    case .success(let result) :
                         
                        weakSelf?.dataSource = result
                        weakSelf?.view.showNews(self.dataSource.map({
                         return NewsCollectionCell.NewsDisplayItem(title: $0.title, newsDesc: $0.newsDesc, imgUrl: $0.urlToImage)
                        }))
                }
        })
        
        self.view.showNews([])
    }
    
    func navBarButtonTapped() {
           self.finishFlow?()
       }
}

extension NewsListPresenter: SearchScreenAdapterDelegate {
    func searchFor(text: String) {
        DataService.shared.searchNewsForString(searchString: text, completion: { [weak weakSelf = self] (result) in
                   switch result {
                       case .failure(let error) :
                           SCLAlertView().showError("Error", subTitle: error.localizedDescription)

                       case .success(let result) :
                            
                           weakSelf?.dataSource = result
                           weakSelf?.view.showNews(self.dataSource.map({
                            return NewsCollectionCell.NewsDisplayItem(title: $0.title, newsDesc: $0.newsDesc, imgUrl: $0.urlToImage)
                           }))
                   }
               })
    }
}
