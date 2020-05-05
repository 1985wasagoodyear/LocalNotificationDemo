//
//  MakeNotificationViewController.swift
//  LocalNotificationDemo
//
//  Created by Kevin Yu on 8/22/18.
//  Copyright © 2018 Kevin Yu. All rights reserved.
//

import UIKit

final class MakeNotificationViewController: UIViewController {

    @IBOutlet var lastBGUpdateLabel: UILabel!
    @IBOutlet var delayOptionsSegControl: UISegmentedControl!
    
    let delayOptions: [Int] = [5, 10, 15, 30, 60]
    let notifyHelper = LocalNotificationHelper()
    
    var delay: Int {
        let index = delayOptionsSegControl.selectedSegmentIndex
        return delayOptions[index]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(appDidBecomeActiveHandler),
                                               name: UIApplication.didBecomeActiveNotification,
                                               object: nil)
        notifyHelper.requestPermissionIfNeeded()
    }

    @IBAction func scheduleLocalNotificationAction(_ sender: Any) {
        let title = "Sun is shinin' in the sky"
        let subtitle = "There ain't a cloud in sight"
        let body = "It's stopped rainin' everybody's in the play"
        notifyHelper.scheduleNotification(title: title,
                                          subtitle: subtitle,
                                          body: body,
                                          delay: delay)
        print("Did schedule a local notification!")
    }
    
    @objc func appDidBecomeActiveHandler() {
        guard let date = UserDefaults.standard.value(forKey: "lastUpdateDate") as? Date else {
            lastBGUpdateLabel.text = "Last BG Update: Never"
            return
        }
        lastBGUpdateLabel.text = "Last BG Update: \(date.timeIntervalSinceNow) seconds ago"
    }
    
    @IBAction func scheduleBackgroundUpdateAction(_ sender: Any) {
        let delay = TimeInterval(self.delay)
        UIApplication.shared.setMinimumBackgroundFetchInterval(delay)
        print("Did set up app for background updates!")
    }
}

