//
//  MovieCellTest.swift
//  JerryAllTests
//
//  Created by Jerry Zhou on 2/6/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

import XCTest

@testable import JerryTest

class MovieCellTest: XCTestCase {
    
    var subject: MovieCell!
    
    override func setUp() {
        subject = MovieCell()
    }
    
    func testConfigure() {
        let name = "Test Name"
        subject.configure(name: name)
        XCTAssertEqual(subject.nameLabel.text, name, "name label")
    }
}
