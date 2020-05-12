//
//  NewsListAssembly.swift
//  TestApp
//
//  Created by vladimir on 30.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
import UIKit

struct NewsListAssembly {
    static func makeNewsListModule() -> NewsListModuleInput? {
        guard let viewController = UIStoryboard(name: "NewsListStoryboard", bundle: nil).instantiateInitialViewController() as? NewsListViewController
        else { return nil }
        
        viewController.output = NewsListPresenter(view: viewController)
        viewController.adapter = NewsListAdapter()
        return viewController.output as? NewsListModuleInput
    }
}
