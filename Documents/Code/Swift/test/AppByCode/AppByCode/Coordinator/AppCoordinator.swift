//
//  AppCoordinator.swift
//  AppByCode
//
//  Created by Jerry Zhou on 10/4/19.
//  Copyright © 2019 Jerry Zhou. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var children: [Coordinator] { get set }
    func start()
}

class AppCoordinator: Coordinator {

    var children: [Coordinator] = []

    var tabBarController: UITabBarController

    init(with tab: UITabBarController) {
          self.tabBarController = tab
    }

    func start() {

        // set navigation controllers
        let navHome = UINavigationController()
        let navCharacter = UINavigationController()
        let navSpell = UINavigationController()
        let navSortingHat = UINavigationController()
        let navProfile = UINavigationController()
        let navOne = UINavigationController()

        // add tab bar item
        navHome.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        navCharacter.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 1)
        navSpell.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        navSortingHat.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 3)
        navProfile.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 4)
        navOne.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 5)

        // set view controllers
        let homeViewController = HomeViewController()
        let charactersViewController = CharactersViewController()
        let spellsViewController = SpellsViewController()
        let sortingHatViewController = SortingHatViewController()
        let profileViewController = ProfileViewController()
        let testVC = UIViewController()

        // push view controllers to navigation controllers
        navHome.pushViewController(homeViewController, animated: true)
        navCharacter.pushViewController(charactersViewController, animated: true)
        navSpell.pushViewController(spellsViewController, animated: true)
        navSortingHat.pushViewController(sortingHatViewController, animated: true)
        navProfile.pushViewController(profileViewController, animated: true)
        navOne.pushViewController(testVC, animated: true)

        let controllers = [navHome, navCharacter, navSpell, navSpell, navProfile, navOne]

        self.tabBarController.viewControllers = controllers
    }

}
