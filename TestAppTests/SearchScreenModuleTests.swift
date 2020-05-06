//
//  SearchScreenModuleTests.swift
//  TestAppTests
//
//  Created by vladimir on 05.05.2020.
//  Copyright © 2020 vladimir. All rights reserved.
//

import XCTest

@testable import TestApp

class SearchScreenModuleTests: XCTestCase {

    override func setUp() {
       super.setUp()
    }

    override func tearDown() {
       super.tearDown()
    }

    func testmoduleAssembly() {
       let module = SearchScreenAssembly.makeSearchNewsmodule()
       XCTAssert(module != nil, "module didn't create")
    }
}
