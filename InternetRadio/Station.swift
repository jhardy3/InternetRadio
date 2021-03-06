//
//  Station.swift
//  InternetRadio
//
//  Created by Jake Hardy on 4/27/16.
//  Copyright © 2016 NSDesert. All rights reserved.
//

import Foundation
import UIKit

class Station {
    
    // MARK: - Class Properties
    
    var stationStream: String
    var stationName: String
    var stationImage: UIImage
    let stationDetail: String
    
    // MARK: - Class Initialization
    
    init(stationStream: String, stationName: String, stationImage: UIImage, stationDetail: String) {
        
        self.stationDetail = stationDetail
        self.stationImage = stationImage
        self.stationName = stationName
        self.stationStream = stationStream
        
    }
    
}