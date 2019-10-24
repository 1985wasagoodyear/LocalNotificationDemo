//
//  MakeNotificationViewController.swift
//  LocalNotificationDemo
//
//  Created by Kevin Yu on 8/22/18.
//  Copyright © 2018 Kevin Yu. All rights reserved.
//

import UIKit

final class MakeNotificationViewController: UIViewController {

    @IBOutlet var delayOptionsSegControl: UISegmentedControl!

    let delayOptions: [Int] = [2, 4, 6, 8, 30]
    let notifyHelper = LocalNotificationHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notifyHelper.requestPermissionIfNeeded()
    }

    @IBAction func buttonAction(_ sender: Any) {
        let title = "Sun is shinin' in the sky"
        let subtitle = "There ain't a cloud in sight"
        let body = "It's stopped rainin' everybody's in the play"
        let index = delayOptionsSegControl.selectedSegmentIndex
        let delay = delayOptions[index]
        notifyHelper.scheduleNotification(title: title,
                                          subtitle: subtitle,
                                          body: body,
                                          delay: delay)
    }
    
}

