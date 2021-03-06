//
//  Show.swift
//  InternetRadio
//
//  Created by Jake Hardy on 5/4/16.
//  Copyright © 2016 NSDesert. All rights reserved.
//

import Foundation
import UIKit

class Show {
    
    // MARK: - Class Properties
    
    var startTimeStandardized: GreenwichTime {
        get {
            return self.startTime.returnTimeBasedOnZone()
        }
    }
    var endTimeStandardized: GreenwichTime {
        get {
            return self.endTime.returnTimeBasedOnZone()
            
        }
    }
    var startTime: GreenwichTime
    var endTime: GreenwichTime
    var hostName: String
    var showStation: String
    var streamURL: String
    var weekend: Bool
    var hostImage: UIImage
    
    
    // MARK: - Class Initialization
    
    init(startTime: GreenwichTime, endTime: GreenwichTime, hostName: String, showStation: String, streamURL: String, weekend: Bool, hostImage: UIImage) {
        self.hostImage = hostImage
        self.startTime = startTime
        self.streamURL = streamURL
        self.endTime = endTime
        self.hostName = hostName
        self.showStation = showStation
        self.weekend = weekend
    }
    
    // MARK: - Class Functions
    
}