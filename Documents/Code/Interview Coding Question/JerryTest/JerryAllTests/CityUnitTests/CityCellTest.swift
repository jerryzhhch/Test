//
//  CityCellTest.swift
//  JerryAllTests
//
//  Created by Jerry Zhou on 2/6/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

import XCTest

@testable import JerryTest

class CityCellTest: XCTestCase {
    
    var subject: CityCell!
    
    override func setUp() {
        subject = CityCell()
    }
    
    func testConfigure() {
        let title = "City Title"
        let rank = "Test Rank"
        subject.configureView(title: title, rank: rank)
        XCTAssertEqual(subject.titleLabel.text, title, "city label")
        XCTAssertEqual(subject.rankLabel.text, rank, "rank label")
    }
}
