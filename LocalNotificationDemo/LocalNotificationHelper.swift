//
//  LocalNotificationHelper.swift
//  LocalNotificationDemo
//
//  Created by K Y on 10/24/19.
//  Copyright © 2019 Kevin Yu. All rights reserved.
//

import Foundation
import UserNotifications

class LocalNotificationHelper {
    
    private let center = UNUserNotificationCenter.current()
    private var authGranted = false
    
    init() { }
    
    // 1. request access from the notificationCenter
    func requestPermissionIfNeeded() {
        if authGranted == true { return }
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        center.requestAuthorization(options: options)
        { (granted, error) in
            self.authGranted = granted
        }
    }
    
    // 2. schedule a notification to fire
    func scheduleNotification(title: String,
                              subtitle: String,
                              body: String,
                              delay: Int) {
        if authGranted == false { return }
        // A. make message with content
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.body = body
        content.badge = 1
        
        // B. create a trigger for when it will happen
        //    this one uses a timed trigger, but you can have many options
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(delay),
                                                        repeats: false)
        
        // C. create a request with aunique identifier
        let requestIdentifier = "demoNotification"
        let request = UNNotificationRequest(identifier: requestIdentifier,
                                            content: content,
                                            trigger: trigger)
        
        // D. add request to notification center
        center.add(request,
                   withCompletionHandler: { (error) in
                    // Handle error here, if error in scheduling error
        })
        
    }
}
