//
//  LogTableViewCell.swift
//  Hanson
//
//  Created by Lily Jang on 2017-07-12.
//  Copyright © 2017 Lily Jang. All rights reserved.
//

import UIKit

class LogTableViewCell: UITableViewCell {
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var param1Label: UILabel!

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var param3Label: UILabel!
    @IBOutlet weak var param4Label: UILabel!
    @IBOutlet weak var param2Label: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
