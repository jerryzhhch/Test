//
//  TabBarItem.swift
//  AppByCode
//
//  Created by Jerry Zhou on 1/21/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

import UIKit

enum TabBarItem: Int, CaseIterable {
    case home = 0
    case characters
    case spells
    case sortingHat
    case profile

    var title: String {
        switch self {
        case .home:
            return "Home"
        case .characters:
            return "Characters"
        case .spells:
            return "Spells"
        case .sortingHat:
            return "Hat"
        case .profile:
            return "Profile"
        }
    }

    var image: UIImage? {
        switch self {
        case .home:
            return UIImage(named: "Tab/home")
        case .characters:
            return UIImage(named: "Tab/characters")
        case .spells:
            return UIImage(named: "Tab/spells")
        case .sortingHat:
            return UIImage(named: "Tab/sortingHat")
        case .profile:
            return UIImage(named: "Tab/profile")
        }
    }
}
