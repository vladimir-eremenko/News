//
//  CommonCoordinator.swift
//  TestApp
//
//  Created by vladimir on 25.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation

class CommonCoordinator: Coordinatable {
    
    var childCoordinators: [Coordinatable] = []
    
    // Please override start
    func start() {}
    
    func runFlow(coordinator: Coordinatable & Finishable, opening: @escaping EmptyCallback) {
        
        addDependency(coordinator)
    }
}

private extension CommonCoordinator {
    func addDependency(_ coordinator: Coordinatable) {
        guard !self.childCoordinators.contains(where: { $0 === coordinator }) else { return }
        self.childCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinatable?) {
        guard !self.childCoordinators.isEmpty,
            let coordinator = coordinator
            else { return }
        
        if let coordinator = coordinator as? CommonCoordinator,
            !coordinator.childCoordinators.isEmpty {
            
            coordinator.childCoordinators
                .filter { $0 !== coordinator }
                .forEach { coordinator.removeDependency($0) }
        }
        
        for (index, element) in self.childCoordinators.enumerated() where element === coordinator {
            self.childCoordinators.remove(at: index)
            break
        }
    }
}
