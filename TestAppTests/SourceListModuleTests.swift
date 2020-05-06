//
//  SourceListModuleTests.swift
//  TestAppTests
//
//  Created by vladimir on 05.05.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import XCTest

@testable import TestApp

class SourceListModuleTests: XCTestCase {

   override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testmoduleAssembly() {
        let module = SourceListAssembly.makeSourcesModule(showOnlyFavorites: true)
        XCTAssert(module != nil, "module didn't create")
        
        let module2 = SourceListAssembly.makeSourcesModule(showOnlyFavorites: false)
        XCTAssert(module2 != nil, "module didn't create")
        
        let module3 = SourceListAssembly.makeSourcesModule()
        XCTAssert(module3 != nil, "module didn't create")
        
        let module4 = SourceListAssembly.makeFavoritesSourcesModule()
        XCTAssert(module4 != nil, "module didn't create")
    }

}
