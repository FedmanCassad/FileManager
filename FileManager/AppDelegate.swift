//
//  AppDelegate.swift
//  FileManager
//
//  Created by Vladimir Banushkin on 10.01.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

 var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let mainVC = MainScreen()
    let navController = UINavigationController(rootViewController: mainVC)
    window?.rootViewController = navController
    window?.makeKeyAndVisible()
    return true
  }

}

