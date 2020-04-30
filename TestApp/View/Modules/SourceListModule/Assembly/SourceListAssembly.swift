//
//  SourceListAssembly.swift
//  TestApp
//
//  Created by vladimir on 23.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
import UIKit

struct SourceListAssembly {
    static func makeSourcesModule(showOnlyFavorites: Bool) -> SourcesListModuleInput? {
        
        if showOnlyFavorites {
            return self.makeFavoritesSourcesModule()
        } else {
            return self.makeSourcesModule()
        }
    }
    
    static func makeSourcesModule() -> SourcesListModuleInput? {
        guard let viewController = UIStoryboard(name: "SourceListStoryboard", bundle: nil).instantiateInitialViewController() as? SourceListViewController
        else { return nil }
        
        viewController.output = SourceListPresenter(view: viewController)
        viewController.adapter = SourceListAdapter()
        viewController.adapter.delegate = viewController.output as? SourceListAdapterDelegate
        return viewController.output as? SourcesListModuleInput
    }
    
    static func makeFavoritesSourcesModule() -> SourcesListModuleInput? {
        guard let viewController = UIStoryboard(name: "FavouriteSourcesListStoryboard", bundle: nil).instantiateInitialViewController() as? FavouriteSourceListViewController
        else { return nil }
        
        viewController.output = SourceListPresenter(onlyFavoritesView: viewController)
        viewController.adapter = FavouriteSourceListAdapter()
        viewController.adapter.delegate = viewController.output as? SourceListAdapterDelegate
        return viewController.output as? SourcesListModuleInput
    }
}
