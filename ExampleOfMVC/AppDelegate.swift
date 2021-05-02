//
//  AppDelegate.swift
//  ExampleOfMVC
//
//  Created by Faiq Khan on 02/05/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = NavigationController(rootViewController: BooksTableViewController())
       
        return true
    }


}

