//
//  MainTabViewController.swift
//  AppByCode
//
//  Created by Jerry Zhou on 11/25/19.
//  Copyright © 2019 Jerry Zhou. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {
    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        let navOne = UINavigationController()
        let navTwo = UINavigationController()
        let navThree = UINavigationController()
        let navFour = UINavigationController()
        let navFive = UINavigationController()

        let homeViewController = HomeViewController()
        let charactersViewController = CharactersViewController()
        let sortingHatViewController = SortingHatViewController()
        let spellsViewController = SpellsViewController()
        let profileViewController = ProfileViewController()

        navOne.tabBarItem = UITabBarItem(title: TabBarItem.home.title,
                                         image: TabBarItem.home.image,
                                         tag: TabBarItem.home.rawValue)
        navTwo.tabBarItem = UITabBarItem(title: TabBarItem.characters.title,
                                         image: TabBarItem.characters.image,
                                         tag: TabBarItem.characters.rawValue)
        navThree.tabBarItem = UITabBarItem(title: TabBarItem.spells.title,
                                           image: TabBarItem.spells.image,
                                           tag: TabBarItem.spells.rawValue)
        navFour.tabBarItem = UITabBarItem(title: TabBarItem.sortingHat.title,
                                          image: TabBarItem.sortingHat.image,
                                          tag: TabBarItem.sortingHat.rawValue)
        navFive.tabBarItem = UITabBarItem(title: TabBarItem.profile.title,
                                          image: TabBarItem.profile.image,
                                          tag: TabBarItem.profile.rawValue)

        navOne.pushViewController(homeViewController, animated: true)
        navTwo.pushViewController(charactersViewController, animated: true)
        navThree.pushViewController(spellsViewController, animated: true)
        navFour.pushViewController(sortingHatViewController, animated: true)
        navFive.pushViewController(profileViewController, animated: true)

        self.viewControllers = [navOne, navTwo, navThree, navFour, navFive]
    }
//
//    private func bind() {
//            let tableView = self.moreNavigationController.topViewController?.view as! UITableView
//            tableView.rowHeight = 80
//            tableView.delegate = self
//        }
}

extension MainTabViewController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item)
    }
}
