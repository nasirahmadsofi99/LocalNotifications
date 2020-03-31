//
//  NotificationDisplayCell.swift
//  localNotifications
//
//  Created by Deftsoft on 16/08/19.
//  Copyright © 2019 Deftsoft. All rights reserved.
//

import UIKit

class NotificationDisplayCell: UITableViewCell {

    @IBOutlet weak var notificationTittleLabel: UILabel!
    @IBOutlet weak var notificationBodyLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
