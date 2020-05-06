//
//  NewsListModuleTest.swift
//  TestAppTests
//
//  Created by vladimir on 05.05.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import XCTest

@testable import TestApp

class NewsListModuleTest: XCTestCase {

    override func setUp() {
       super.setUp()
    }

    override func tearDown() {
       super.tearDown()
    }

    func testmoduleAssembly() {
       let module = NewsListAssembly.makeNewsListModule()
       XCTAssert(module != nil, "module didn't create")
    }

}
