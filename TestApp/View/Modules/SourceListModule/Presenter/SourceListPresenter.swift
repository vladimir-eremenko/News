//
//  SourceListPresenter.swift
//  TestApp
//
//  Created by vladimir on 23.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
import UIKit

final class SourceListPresenter {
    
    private weak var view: SourceListViewInput!
    private var dataSource: [Source] = []
    private var showOnlyFavorites : Bool = false
    
    var finishFlow: EmptyCallback?
    
    init(onlyFavoritesView view: SourceListViewInput) {
        self.view = view
        self.showOnlyFavorites = true
    }
    
    init(view: SourceListViewInput) {
        self.view = view
    }
}

extension SourceListPresenter: SourcesListModuleInput {
    
    func toPresent() -> UIViewController? {
        return self.view as? UIViewController
    }
}

extension SourceListPresenter: SourceListViewOutput {
    func viewDidLoad() {
        DataService.shared.fetchSources {[weak weakSelf = self] (result) in
            switch result {
                case .failure(let error) :
                    print("\(error)")

                case .success(let result) :
                    if (weakSelf?.showOnlyFavorites)! {
                        weakSelf?.dataSource = DataService.shared.favoriteSources
                        
                    } else {
                        weakSelf?.dataSource = result
                    }
                    weakSelf?.view.showSources(self.dataSource.map({
                        return SourceCell.SourceDisplayItem(name: $0.name, sourceDesc: $0.sourceDesc, isFavorite: $0.isFavorite)
                    }))
            }
        }
    }
    
    func navBarButtonTapped() {
        self.finishFlow?()
    }
    
    func viewWillAppear() {
        if (self.showOnlyFavorites) {
            self.dataSource = DataService.shared.favoriteSources
        } else {
            self.dataSource = DataService.shared.sources
        }
        self.view.showSources(self.dataSource.map({
            return SourceCell.SourceDisplayItem(name: $0.name, sourceDesc: $0.sourceDesc, isFavorite: $0.isFavorite)
        }))
    }
}

extension SourceListPresenter: SourceListAdapterDelegate {
    func addToFavoriteSourceWithIndex(index: Int) {
        let source = self.dataSource[index]
        source.isFavorite = true
        DataService.shared.saveFavorite(source: source)
        self.view.showSources(self.dataSource.map({
            return SourceCell.SourceDisplayItem(name: $0.name, sourceDesc: $0.sourceDesc, isFavorite: $0.isFavorite)
        }))
    }
    
    func removeFavoriteSourceWithIndex(index: Int) {
        DataService.shared.removeFavorite(source: self.dataSource[index])
        self.dataSource.remove(at: index)
    }
}
