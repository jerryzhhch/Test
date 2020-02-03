//
//  Character.swift
//  AppByCode
//
//  Created by Jerry Zhou on 1/21/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

import Foundation

struct Character: Codable {
    let name: String?
//    let role: String?
//    let house: String?
//    let school: String?
//    let ministryOfMagic: Bool
//    let orderOfThePhoenix: Bool
//    let dumbledoresArmy: Bool
//    let deathEater: Bool
//    let bloodStatus: String?
//    let species: String?

    init(mockDict: [String: Any]) {
        self.name = mockDict["name"] as? String
    }
}
