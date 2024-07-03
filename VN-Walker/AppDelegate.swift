//
//  AppDelegate.swift
//  VN-Walker
//
//  Created by Huy on 2/7/24.
//  Copyright © Huy. All rights reserved.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    static let shared: AppDelegate = UIApplication.shared.delegate as! AppDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print(application)
        print(launchOptions)
        window = UIWindow(frame: UIScreen.main.bounds)
        let splashVC = SplashViewController()
        window?.rootViewController = splashVC
        window?.makeKeyAndVisible()
        return true
    }
}

extension AppDelegate {
    func loadLoginViewController() {
        let navigationVC = UINavigationController()
        navigationVC.setNavigationBarHidden(true, animated: false)
        navigationVC.navigationBar.barStyle = .black
        window?.rootViewController = navigationVC
        // swiftlint:disable redundantType
        let loginVC: TestViewController = TestViewController.initFromStoryboard(feature: .login)
        navigationVC.pushViewController(loginVC, animated: false)
    }
}
