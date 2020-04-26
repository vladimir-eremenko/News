//
//  Routable.swift
//  TestApp
//
//  Created by vladimir on 24.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
protocol Routable: Presentable {
    func present(module: Presentable?)
    func present(module: Presentable?, animated: Bool)
    
    func push(module: Presentable?)
    func push(module: Presentable?, hideBottomBar: Bool)
    func push(module: Presentable?, animated: Bool)
    func push(module: Presentable?, animated: Bool, completion: EmptyCallback?)
    func push(module: Presentable?, animated: Bool, hideBottomBar: Bool, completion: EmptyCallback?)
    
    func popModule()
    func popModule(animated: Bool)
    
    func dismissModule()
    func dismissModule(animated: Bool, completion: EmptyCallback?)
    
    func setRootModule(_ module: Presentable?)
    func setRootModule(_ module: Presentable?, hideBar: Bool)
    
    func popToRootModule(animated: Bool)
}
