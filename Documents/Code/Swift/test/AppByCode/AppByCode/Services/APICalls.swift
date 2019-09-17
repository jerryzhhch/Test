//
//  APICalls.swift
//  AppByCode
//
//  Created by Jerry Zhou on 7/23/19.
//  Copyright © 2019 Jerry Zhou. All rights reserved.
//

import Foundation

struct APICalls {
    static let base = "https://www.googleapis.com/books/v1/volumes?q="

    static func getURL(_ query: String) -> String {
        return base + query
    }
}
