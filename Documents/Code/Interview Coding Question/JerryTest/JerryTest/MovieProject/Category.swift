//
//  Category.swift
//  JerryTest
//
//  Created by Jerry Zhou on 2/3/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

struct CategoryResponse: Codable {
    let Categories: [CategoryInfo]
}

struct CategoryInfo: Codable {
    let title: String
    let movies: [String]?
}
