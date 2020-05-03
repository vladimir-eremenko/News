//
//  Finishable.swift
//  TestApp
//
//  Created by vladimir on 29.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
protocol Finishable: AnyObject {
    var finishFlow: EmptyCallback? { get set }
}
