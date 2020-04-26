//
//  AppDelegate.swift
//  TestApp
//
//  Created by vladimir on 15.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootController: UITabBarController {
        return self.window!.rootViewController as! UITabBarController
    }
    var applicationCoordinator: Coordinatable!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.applicationCoordinator = TabbarCoordinator(root: rootController)
        self.applicationCoordinator.start()
        
        return true
    }


}

