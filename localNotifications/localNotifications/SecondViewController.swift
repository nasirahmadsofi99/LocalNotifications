//
//  SecondViewController.swift
//  localNotifications
//
//  Created by Deftsoft on 16/07/19.
//  Copyright © 2019 Deftsoft. All rights reserved.
//

import UIKit


var notificationBodyData = [String]()
var notificationBodyTitle = [String]()

class SecondViewController: UIViewController {
    
//    var notificationBodyData = [String]()
//     var notificationBodyTitle = [String]()
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationBodyData.removeAll()
        notificationBodyTitle.removeAll()
        CoreDataManager.fetchBrandNames()
        tableView.tableFooterView = UIView()
    }
    


}
extension SecondViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationBodyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotificationDisplayCell
        cell.notificationTittleLabel.text = notificationBodyTitle[indexPath.row]
        cell.notificationBodyLabel.text = notificationBodyData[indexPath.row]
        return cell
    }
    
    
}

