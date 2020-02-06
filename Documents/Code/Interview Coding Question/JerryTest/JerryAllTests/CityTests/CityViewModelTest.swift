//
//  JerryAllTests.swift
//  JerryAllTests
//
//  Created by Jerry Zhou on 2/1/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

import XCTest

@testable import JerryTest

class CityViewModelTest: XCTestCase {

    private var mockService: MockServiceLayer!
    private var subject: CityViewable!

    override func setUp() {
        mockService = MockServiceLayer()
        subject = CityViewModel(service: mockService)
    }
    
    func testGetCities() {
        subject.getCites()
        XCTAssertTrue(mockService.isGetJSONCitiesCalled)
    }
}
