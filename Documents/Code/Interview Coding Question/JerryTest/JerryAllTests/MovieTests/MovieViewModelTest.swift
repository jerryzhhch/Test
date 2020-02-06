//
//  MovieViewModel.swift
//  JerryAllTests
//
//  Created by Jerry Zhou on 2/3/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

import XCTest

@testable import JerryTest

class MovieViewModelTest: XCTestCase {
    
    private var mockService: MockServiceLayer!
    private var subject: MovieViewable!
    
    override func setUp() {
        mockService = MockServiceLayer()
        subject = MovieViewModel(service: mockService)
    }
    
    func testGetCategories() {
        subject.getCategories()
        XCTAssertTrue(mockService.isGetJSONCategoriesCalled)
    }
    
}
