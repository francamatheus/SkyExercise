//
//  AppDelegate.swift
//  SkyExercise
//
//  Created by Matheus França on 13/12/19.
//  Copyright © 2019 Matheus França. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    internal func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupRoot()
        setupNavBar()
        return true
    }
    
    private func setupNavBar() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().tintColor = .white
        //Clear navBar
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().backgroundColor = .clear
        
    }
    
    private func setupRoot() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let rootViewController = HomeViewController()
        let navigation : UINavigationController = UINavigationController(rootViewController: rootViewController)
        self.window?.rootViewController = navigation
        self.window?.makeKeyAndVisible()
    }
}

