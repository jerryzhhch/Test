//
//  ServiceLayerTest.swift
//  JerryAllTests
//
//  Created by Jerry Zhou on 2/6/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

import XCTest

@testable import JerryTest

class ServiceLayerTest: XCTestCase {

    var subject: ServiceLayer!
    
    var cities: [City] = []
    var categories: [CategoryInfo] = []
    
    override func setUp() {
        subject = FakeServiceLayerImp.shared
    }
    
    func testGetJSONCities() {
        subject.getJSONCites { [weak self] (data) in
            self?.cities = data
        }
        XCTAssert(cities.count == 3)
    }
    
    func testGetJSONCategoriesCalled() {
        subject.getJSONCategoriesCalled { [weak self] (data) in
            self?.categories = data
        }
        XCTAssert(categories.count == 4)
    }
}


