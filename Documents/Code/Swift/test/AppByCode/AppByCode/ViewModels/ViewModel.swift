//
//  ViewModel.swift
//  AppByCode
//
//  Created by Jerry Zhou on 7/23/19.
//  Copyright © 2019 Jerry Zhou. All rights reserved.
//

import Foundation

protocol Delegate: class {
    func updateView()
}

class ViewModel {

    weak var delegate: Delegate?

    var books = [Book]() {
        didSet {
            delegate?.updateView()
        }
    }

    var currentBook: Book!

    func getBooks(query: String) {
        apiService.getBooks(query) { [unowned self] (data) in
            guard let books = data else { return }
            self.books = books
            print("Book count: \(self.books.count)")
        }
    }

}// end class
