//
//  Movie.swift
//  AppByCode
//
//  Created by Jerry Zhou on 1/24/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

import Foundation

//struct Movies: Codable {
//    var title: String
//    var movies: [String]?
//
//    enum CodingKeys: String, CodingKey {
//        case categories = "Categories"
//        case title, movies
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        let categories = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .categories)
//        title = try categories.decode(String.self, forKey: .title)
//        movies = try categories.decode([String]?.self, forKey: .movies)
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        var categories = container.nestedContainer(keyedBy: CodingKeys.self, forKey: .categories)
//        try categories.encode(title, forKey: .title)
//        try categories.encode(movies, forKey: .movies)
//    }
//}

struct Movies: Decodable {
    let Categories: [Category]
}

struct Category: Decodable {
    let title: String
    let movies: [String]?
}
