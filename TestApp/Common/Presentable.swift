//
//  Presentable.swift
//  TestApp
//
//  Created by vladimir on 24.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import UIKit
protocol Presentable: AnyObject {
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
    func toPresent() -> UIViewController? {
        return self
    }
}
