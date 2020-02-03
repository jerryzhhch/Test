//
//  APIQuery.swift
//  AppByCode
//
//  Created by Jerry Zhou on 1/21/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

import Foundation

struct APIQuery {
    static let base = "https://www.potterapi.com/v1/"
    static let key = "?key=$2a$10$idZjM/FDq8YHQyMtJNXH1O0yGtByyfv3hRm5m8uqlx7GapddU7i5W"

    static func getCharactersString() -> String {
        return base + APIKeys.characters.rawValue + key
    }
}
