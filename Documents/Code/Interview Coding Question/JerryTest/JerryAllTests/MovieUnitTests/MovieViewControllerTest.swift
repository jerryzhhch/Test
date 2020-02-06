//
//  MovieViewControllerTest.swift
//  JerryAllTests
//
//  Created by Jerry Zhou on 2/3/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

import XCTest

@testable import JerryTest

class MovieViewControllerTest: XCTestCase {
    
    private var mockViewModel: MockMovieViewModel!
    private var subject: MovieViewController!
    
    override func setUp() {
        mockViewModel = MockMovieViewModel()
        subject = MovieViewController(viewModel: mockViewModel)
    }
    
    func testBindView() {
        subject.viewDidLoad()
        let rows = subject.rootView.tableView.numberOfRows(inSection: 0)
        XCTAssert(rows == 4)
    }
}
