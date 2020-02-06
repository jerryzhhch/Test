//
//  AppDelegate.swift
//  JerryTest
//
//  Created by Jerry Zhou on 2/1/20.
//  Copyright © 2020 Jerry Zhou. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = MovieViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

