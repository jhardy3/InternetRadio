//
//  DateExtension.swift
//  Coded
//
//  Created by Jake Hardy on 4/26/16.
//  Copyright © 2016 NSDesert. All rights reserved.
//

import Foundation

enum GreenwichTime: Int {
    case OneAM = 1
    case TwoAM = 2
    case ThreeAM = 3
    case FourAM = 4
    case FiveAM = 5
    case SixAM = 6
    case SevenAM = 7
    case EightAM = 8
    case NineAM = 9
    case TenAM = 10
    case ElevenAM = 11
    case TwelvePM = 12
    case OnePM = 13
    case TwoPM = 14
    case ThreePM = 15
    case FourPM = 16
    case FivePM = 17
    case SixPM = 18
    case SevenPM = 19
    case EightPM = 20
    case NinePM = 21
    case TenPM = 22
    case ElevenPM = 23
    case TwelveAM = 0
    
    func returnTimeBasedOnZone() -> GreenwichTime {
        let offset = DateStandardizer.returnOffset()
        let time = self.rawValue
        
        if offset > 0 {
            let returnTime = abs(time + offset) % 24
            return GreenwichTime(rawValue: returnTime)!
        } else {
            if abs(offset) > time {
                let returnRemainder = abs(time - abs(offset))
                let returnTime = 24 - returnRemainder
                
                return GreenwichTime(rawValue: returnTime)!
            } else {
                let returnTime = time - abs(offset)
                
                return GreenwichTime(rawValue: returnTime)!
            }
        }
        
    }
    
    func returnTimeString() -> String {
        var returnString = ""
        if self.rawValue == 0 || self.rawValue == 12 {
            returnString = "12 "
        } else {
            returnString = "\(self.rawValue % 12) "
        }
        switch self.rawValue {
        case 0...11:
            return returnString + "AM"
        default:
            return returnString + "PM"
        }
    }
}

extension NSDate {
    
    func stringValue() -> String {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        formatter.timeStyle = .ShortStyle
        return formatter.stringFromDate(self)
    }
    
}

class DateStandardizer {
    
    static let currentTimeZone = NSTimeZone.defaultTimeZone()
    
    static func returnOffset() -> Int {
        let total = currentTimeZone.secondsFromGMT / 3600
        return total
    }
    
    static func returnAcronym() -> String {
        guard let currentTimeZoneAcronym = currentTimeZone.abbreviation else { return "" }
        
        return currentTimeZoneAcronym
    }
    
}
