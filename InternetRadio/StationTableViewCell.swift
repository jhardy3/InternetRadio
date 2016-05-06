//
//  StationTableViewCell.swift
//  InternetRadio
//
//  Created by Jake Hardy on 5/3/16.
//  Copyright © 2016 NSDesert. All rights reserved.
//

import UIKit

class StationTableViewCell: UITableViewCell {

    @IBOutlet weak var stationImageView: UIImageView!
    
    @IBOutlet weak var stationNameLabel: UILabel!
    
    @IBOutlet weak var stationDetailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
