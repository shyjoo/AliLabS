//
//  ListTableViewCell.swift
//  Hanson
//
//  Created by ParkPyosang on 2017. 7. 27..
//  Copyright © 2017년 Lily Jang. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var fnameLabel: UILabel!
    @IBOutlet weak var lnameLabel: UILabel!
    @IBOutlet weak var sinLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
