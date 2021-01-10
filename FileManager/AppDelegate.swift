//
//  AppDelegate.swift
//  FileManager
//
//  Created by Vladimir Banushkin on 10.01.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let mainVC = MainScreen()
    var navController = UINavigationController(rootViewController: mainVC)
//    configuringNavigationBar(with: navController)
    window?.rootViewController = navController
    window?.makeKeyAndVisible()
    // Override point for customization after application launch.
    return true
  }
  
//  func configuringNavigationBar( with navigationController: UINavigationController) {
//
//    let image = UIImage(named: "addDirectory")
//    print(image)
//    let createFolderToolBarItem = UIBarButtonItem(image: image, style: .plain, target: nil, action: nil)
//    navigationController.navigationItem.rightBarButtonItem = createFolderToolBarItem
//
//
//  }

}

