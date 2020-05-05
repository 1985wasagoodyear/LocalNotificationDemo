//
//  AppDelegate.swift
//  LocalNotificationDemo
//
//  Created by Kevin Yu on 8/22/18.
//  Copyright © 2018 Kevin Yu. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    func application(_ application: UIApplication,
                     performFetchWithCompletionHandler completionHandler:
        @escaping (UIBackgroundFetchResult) -> Void) {
        UserDefaults.standard.set(Date(), forKey: "lastUpdateDate")
        completionHandler(.newData)
        print("did update app in background")
    }

}

