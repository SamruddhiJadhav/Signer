//
//  AppDelegate.swift
//  Signer
//
//  Created by Samruddhi on 22/02/20.
//  Copyright © 2020 Samruddhi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationController = UINavigationController(rootViewController: SetupAccountWireframe.presentSetupAccountModule())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

