//
//  ViewController.swift
//  localNotifications
//
//  Created by Deftsoft on 16/07/19.
//  Copyright © 2019 Deftsoft. All rights reserved.

import UIKit
import UserNotifications

class ViewController: UIViewController,UNUserNotificationCenterDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.sound,.badge,.alert]) { (granted,error ) in
            if granted{
                print("Access Granted")
                
            } else {
                print("Access Denied")
            }
        }
       
    }

    
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func sendNotification(_ sender: UIButton) {
         self.localNotifications()
    }
    
    func localNotifications(){
        let content = UNMutableNotificationContent()
        content.title = "Summer Sale"
        content.body = "Flat 50% Off on all Products"
        content.sound = UNNotificationSound.default
        CoreDataManager.saveLocalNotificationData(title:content.title, body: content.body)
        let imageName = "applelogo"
        guard let imageUrl = Bundle.main.url(forResource: imageName, withExtension: "png") else {
            return
        }
        let attachment  = try! UNNotificationAttachment(identifier: imageName, url: imageUrl, options: .none)
        content.attachments = [attachment]
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "notification.id.01", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
//        let notificationTitle = response.notification.request.content.title
//        let notificationBody = response.notification.request.content.body
//        print(notificationTitle)
//        print(notificationBody)
//        CoreDataManager.saveLocalNotificationData(title: notificationTitle, body: notificationBody)
        
        completionHandler()
        
    }
}

