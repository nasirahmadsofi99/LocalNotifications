//
//  CoreDataManager.swift
//  localNotifications
//
//  Created by Deftsoft on 16/08/19.
//  Copyright © 2019 Deftsoft. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager: NSObject {
    
    private class func getContext() -> NSManagedObjectContext {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        return appdelegate.persistentContainer.viewContext
    }
    class func saveLocalNotificationData(title:String,body:String) {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "GeoNotification", in: context)
        let newdata = NSManagedObject(entity: entity!, insertInto: context)
          newdata.setValue(title, forKey: "notificationTitle")
          newdata.setValue(body, forKey: "notificationBody")
        do {
            try context.save()
            print("data saved")
        }catch {
            print("***************** error while Saving *********")
        }
    }
    
    class func fetchBrandNames() {
        let context = getContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GeoNotification")
        do {
            let geoNotification = try context.fetch(fetchRequest)
            for notification in geoNotification {
                let notificationData = notification as! NSManagedObject
                let notificBody = notificationData.value(forKey:"notificationBody") as? String ?? ""
                let notificTitle = notificationData.value(forKey: "notificationTitle") as? String ?? ""
                 notificationBodyData.append(notificBody)
                 notificationBodyTitle.append(notificTitle)
                }
            
           } catch {
            print("error")
            
        }
        
    }
    
    class func deleteAllData(){
        let context = getContext()
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "GeoNotification")
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
            print("data deleted from coreData")
            do {
                try context.execute(deleteRequest)
                try context.save()
            } catch {
                print ("There was an error")
            }
        }
    }
    
    

