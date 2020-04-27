//
//  SearchScreenAssembly.swift
//  TestApp
//
//  Created by vladimir on 27.04.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import Foundation
import UIKit

struct SearchScreenAssembly {
    static func makeSearchNewsmodule() -> SearchScreenModuleInput? {
        guard let viewController = UIStoryboard(name: "SearchStoryboard", bundle: nil).instantiateInitialViewController() as? SearchScreenViewController
        else { return nil }
        
        viewController.output = SearchScreenPresenter(view: viewController)
        viewController.adapter = SearchScreenAdapter()
//        viewController.adapter.delegate = viewController.output as? SourceListAdapterDelegate
        return viewController.output as? SearchScreenModuleInput
    }
}
