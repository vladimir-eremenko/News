//
//  TabbarCoordinator.swift
//  TestApp
//
//  Created by vladimir on 25.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import UIKit
final class TabbarCoordinator: CommonCoordinator {
    
    private let rootViewController: UITabBarController
    
    init(root: UITabBarController) {
        self.rootViewController = root
    }
    
    override func start() {
        super.start()
        
        let sourceListCoordinator = SourceListCoordinator(onlyFavorite: false)
        let favoriteSourceListCoordinator = SourceListCoordinator(onlyFavorite: true)
        let searchScreenCoordinator = SearchScreenCoordinator()
        
        sourceListCoordinator.start()
        favoriteSourceListCoordinator.start()
        searchScreenCoordinator.start()
        
        sourceListCoordinator.rootController.tabBarItem = UITabBarItem(title: "Channels", image: UIImage(systemName: "list.bullet"), tag: 0)
        favoriteSourceListCoordinator.rootController.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(systemName: "star.fill"), tag: 1)
        searchScreenCoordinator.rootController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        
        self.rootViewController.viewControllers = [sourceListCoordinator.rootController, favoriteSourceListCoordinator.rootController, searchScreenCoordinator.rootController]
        
    }

}
