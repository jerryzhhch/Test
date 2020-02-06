//
//  CityViewControllerTest.swift
//  JerryAllTests
//
//  Created by Jerry Zhou on 2/1/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

import XCTest

@testable import JerryTest

class CityViewControllerTest: XCTestCase {
    
    private var mockViewModel: MockCityViewModel!
    private var subject: CityViewController!
    
    override func setUp() {
        mockViewModel = MockCityViewModel()
        subject = CityViewController(viewModel: mockViewModel)
    }
    
    func testBindView() {
        subject.viewDidLoad()
        let rows = subject.rootView.tableView.numberOfRows(inSection: 0)
        XCTAssertTrue(rows == 3)
    }
}
