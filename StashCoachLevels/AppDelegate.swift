//
//  AppDelegate.swift
//  StashCoachLevels
//
//  Created by Samuel Boyce on 2/12/20.
//  Copyright © 2020 Samuel Boyce. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let coachLevels = CoachLevelRouter.createModule()
        let nav = UINavigationController(rootViewController: coachLevels)
        nav.navigationBar.barTintColor = .systemPurple
        nav.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        return true
    }

}
