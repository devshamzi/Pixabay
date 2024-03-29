//
//  AppDelegate.swift
//  Pixabay
//
//  Created by Shamzi on 06/12/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: MainCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let navController = UINavigationController()

        // send that into our coordinator so that it can display view controllers
        coordinator = MainCoordinator(navigationController: navController)

        // tell the coordinator to take over control
        coordinator?.goTohome()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()

        return true
    }
}

