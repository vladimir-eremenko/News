//
//  SourceListCoordinator.swift
//  TestApp
//
//  Created by vladimir on 25.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import UIKit
final class SourceListCoordinator: CommonCoordinator {
    let rootController = UINavigationController()
    private let router: Routable
    private let onlyFavorite: Bool
    
    init(onlyFavorite: Bool) {
        router = AppRouter(rootController: rootController)
        self.onlyFavorite = onlyFavorite
    }
    
    override func start() {
        super.start()

        if self.onlyFavorite {
            self.showOnlyFavouriteSources()
        } else {
            self.showSources()
        }
    }
    
    func showSources() {
         guard let module : SourcesListModuleInput = SourceListAssembly.makeSourcesModule(showOnlyFavorites: onlyFavorite) else { fatalError("module initialization error") }
        
        self.router.setRootModule(module)
    }
  
    func showFavouriteNews() {
        //here should be news list
        guard let module : NewsListModuleInput = NewsListAssembly.makeNewsListModule() else {
                   fatalError("module initialization error") }
        
        self.router.setRootModule(module, hideBar: false)
        module.finishFlow = { [weak self] in
            self?.showOnlyFavouriteSources()
        }
    }
    
    func showOnlyFavouriteSources() {
        guard let module : SourcesListModuleInput = SourceListAssembly.makeSourcesModule(showOnlyFavorites: onlyFavorite) else { fatalError("module initialization error") }
        
        self.router.setRootModule(module, hideBar: false)
        module.finishFlow = { [weak self] in
            self?.showFavouriteNews()
        }
    }
}
