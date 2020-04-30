//
//  SearchScreenCoordinator.swift
//  TestApp
//
//  Created by vladimir on 27.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
import UIKit

final class SearchScreenCoordinator: CommonCoordinator {
    let rootController = UINavigationController()
    private let router: Routable
    
    override init() {
        router = AppRouter(rootController: rootController)
    }
    
    override func start() {
        super.start()
        
        guard let module : SearchScreenModuleInput = SearchScreenAssembly.makeSearchNewsmodule() else {
            fatalError("module initialization error") }

        self.router.setRootModule(module, hideBar: false)
    }

}
