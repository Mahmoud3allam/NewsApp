//
//  AppDelegate.swift
//  AsgaTechNews
//
//  Created by Alchemist on 15/07/2021.
//  Copyright © 2021 AsgaTech. All rights reserved.
//

import Kingfisher
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = BaseNavigationController(rootViewController: NewsSearchRouter.createAnModule())
        window.makeKeyAndVisible()
        self.window = window
        KingfisherManager.shared.cache.memoryStorage.config.totalCostLimit = 100
        return true
    }
}
