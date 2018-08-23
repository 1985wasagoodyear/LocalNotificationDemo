//
//  ViewController.swift
//  LocalNotificationDemo
//
//  Created by Kevin Yu on 8/22/18.
//  Copyright © 2018 Kevin Yu. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // request access from the notificationCenter
        let notiCenter = UNUserNotificationCenter.current()
        notiCenter.requestAuthorization(options: [[.alert, .sound, .badge]],
                                        completionHandler: { (granted, error) in
                                            // perform additional setup here, 
                                            // depending on status or error
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonAction(_ sender: Any) {
        
        // message content
        let content = UNMutableNotificationContent()
        content.title = "Hey you guys are sleepy"
        content.subtitle = "Are you awake?"
        content.body = "WAKE UP"
        content.badge = 600000
        
        // trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5,
                                                        repeats: false)
        
        // request with unique identifier
        let requestIdentifier = "demoNotification"
        let request = UNNotificationRequest(identifier: requestIdentifier,
                                            content: content, trigger: trigger)
        
        // add request to notification center
        UNUserNotificationCenter.current().add(request,
                                               withCompletionHandler: { (error) in
                                                // Handle error
        })
        
    }
    
}

