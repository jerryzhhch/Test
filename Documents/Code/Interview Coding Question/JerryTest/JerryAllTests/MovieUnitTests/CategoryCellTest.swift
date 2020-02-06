//
//  CategoryCellTest.swift
//  JerryAllTests
//
//  Created by Jerry Zhou on 2/6/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

import XCTest

@testable import JerryTest

class CategoryCellTest: XCTestCase {

    var subject: CategoryCell!
    
    override func setUp() {
        subject = CategoryCell()
    }

    func testConfigure() {
        let movies = ["movie1", "movie2", "movie3", "movie4", "movie5"]
        subject.configure(title: "test", movies: movies)
        let rows = subject.collectionView.numberOfItems(inSection: 0)
        XCTAssert(rows == movies.count)
    }
    
}
