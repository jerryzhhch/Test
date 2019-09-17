//
//  Book.swift
//  AppByCode
//
//  Created by Jerry Zhou on 7/23/19.
//  Copyright © 2019 Jerry Zhou. All rights reserved.
//

import Foundation

struct BookInfo: Codable {
    let items: [Book]
}

class Book: Codable {
    let book_id: String
    let book_info: VolumeInfo

    enum CodingKeys: String, CodingKey {
        case book_id = "id"
        case book_info = "volumeInfo"
    }
}

class VolumeInfo: Codable {
    let book_title: String
    let book_subtitle: String?
//    let authors: [String]
//    let publisher, publishedDate, volumeInfoDescription: String
//    let averageRating: Double
//    let ratingsCount: Double
    let book_images: ImageLinks
//    let previewLink: String
//    let infoLink, canonicalVolumeLink: String

    enum CodingKeys: String, CodingKey {
        case book_title = "title"
        case book_subtitle = "subtitle"
//        case authors, publisher, publishedDate
        case book_images = "imageLinks"
//        case volumeInfoDescription = "description"
//        case averageRating, ratingsCount, imageLinks, previewLink, infoLink, canonicalVolumeLink
    }
}

struct ImageLinks: Codable {
    let smallThumbnail, thumbnail: String
}
