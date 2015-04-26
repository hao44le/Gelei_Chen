//
//  EntryTableViewCell.swift
//  Gelei_Chen
//
//  Created by Gelei Chen on 15/4/25.
//  Copyright (c) 2015年 Geilei_Chen. All rights reserved.
//

import UIKit

class EntryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellText: UILabel!

    
    @IBOutlet weak var cellimage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
