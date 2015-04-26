//
//  CustomTableViewCell.swift
//  Gelei_Chen
//
//  Created by Gelei Chen on 15/4/23.
//  Copyright (c) 2015 Geilei_Chen. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var imageToShow: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
