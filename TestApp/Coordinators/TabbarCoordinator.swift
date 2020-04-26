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
        
        let sourceList = SourceListCoordinator(onlyFavorite: false)
        let favoriteSourceList = SourceListCoordinator(onlyFavorite: true)
        
         sourceList.start()
        favoriteSourceList.start()
        
        
        self.rootViewController.viewControllers = [sourceList.rootController, favoriteSourceList.rootController]
        
    }

}
