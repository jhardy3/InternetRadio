//
//  Timer.swift
//  CountUpTimerTest
//
//  Created by Jake Hardy on 4/21/16.
//  Copyright © 2016 NSDesert. All rights reserved.
//

import UIKit
import Foundation

class Timer {
    
    var time = 0.0
    var timer: NSTimer?
    var delegate: TimerDelegate?
    
    @objc func updateTime() {
        time += 0.01
        
        var elapsedTime: NSTimeInterval = NSTimeInterval(time)
        
        let minutes = UInt8(elapsedTime / 60.0)
        elapsedTime -= (NSTimeInterval(minutes) * 60)
        
        let seconds = UInt8(elapsedTime)
        elapsedTime -= NSTimeInterval(seconds)
        
        let fraction = UInt8(elapsedTime * 100)
        
        var strMinutes = String(minutes)
        var strSeconds = String(seconds)
        var strFraction = String(fraction)
        
        if minutes < 10 {
            strMinutes = "0" + strMinutes
        }
        
        if seconds < 10 {
            strSeconds = "0" + strSeconds
        }
        
        
        delegate?.updatedTimeString("\(strMinutes):\(strSeconds)")
    }
    
    func startTimer() {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }

    func stopTimer() {
        timer?.invalidate()
    }
}

protocol TimerDelegate {
    func updatedTimeString(time: String)
}

func colorWithHexString(hexString: String, alpha:CGFloat? = 1.0) -> UIColor {
    
    // Convert hex string to an integer
    let hexint = Int(intFromHexString(hexString))
    let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
    let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
    let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
    let alpha = alpha!
    
    // Create color object, specifying alpha as well
    let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
    return color
}

func intFromHexString(hexStr: String) -> UInt32 {
    var hexInt: UInt32 = 0
    // Create scanner
    let scanner: NSScanner = NSScanner(string: hexStr)
    // Tell scanner to skip the # character
    scanner.charactersToBeSkipped = NSCharacterSet(charactersInString: "#")
    // Scan hex value
    scanner.scanHexInt(&hexInt)
    return hexInt
}

