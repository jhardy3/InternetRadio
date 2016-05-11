//
//  ShowTableViewCell.swift
//  InternetRadio
//
//  Created by Jake Hardy on 5/5/16.
//  Copyright © 2016 NSDesert. All rights reserved.
//

import UIKit

class ShowTableViewCell: UITableViewCell {

    @IBOutlet weak var hostImageView: UIImageView!
    @IBOutlet weak var hostNameLabel: UILabel!
    @IBOutlet weak var hostDetailLabel: UILabel!
    @IBOutlet weak var onAirLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        onAirLabel.layer.cornerRadius = 4.0
        onAirLabel.clipsToBounds = true
        onAirLabel.backgroundColor = colorWithHexString("FF6666", alpha: 0.9)
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
