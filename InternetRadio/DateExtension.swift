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
        print(offset)
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


/*
 //////////////// YEARS ////////////////////////
 
 "y"    A year with at least 1 digit.
 
 "yy" A year with exactly 2 digits. If less, it is padded with a zero. It will be truncated to the tens digit if larger.
 
 "yyy" A year with at least 3 digits. If less, it is padded with zeros.
 
 "yyyy" A year with at least 3 digits. If less, it is padded with zeros.
 
 //////////////// MONTHS ////////////////////////
 
 "M"    A month with at least 1 digit. July → "7"
 
 "MM" A month with at least 2 digits. If less, it is padded with zeros. July → "07"
 
 "MMM"    Three letter month abbreviation. July → "Jul"
 
 "MMMM"    Full name of month. July → "July"
 
 "MMMMM" One letter month abbreviation. Not unique, January, June, and July are all "J". December → "D"
 
 //////////////// DAYS ////////////////////////
 
 "d"    A day with at least 1 digit. 4 → "4"  25 → "25"
 
 "dd" A day with at least 2 digits. If less, it is padded with a zero. 4 → "04"
 
 "E", "EE", or"EEE"    3 letter day abbreviation of day name. Wednesday → "Wed"
 
 "EEEE"    Full day name. Wednesday → "Wednesday"  Thursday → "Thursday"
 
 "EEEEE" 1 letter day abbreviation of day name. Not unique, Tuesday and Thursday are both "T".  Wednesday → "W"
 
 "EEEEEE"    2 letter day abbreviation of day name. Wednesday → "We"  Thursday → "Th"
 
 //////////////// HOURS ////////////////////////
 
 "a"    Period of day (AM/PM). 5 PM → "PM"  7 AM → "AM"
 
 "h"    A 1-12 based hour with at least 1 digit. 5 PM → "5"  7 AM → "7"
 
 "hh" A 1-12 based hour with at least 2 digits. If less, it is padded with a zero. 5 PM → "05"  7 AM → "07"
 
 "H"    A 0-23 based hour with at least 1 digit. 5 PM → "17"  7 AM → "7"
 
 "HH" A 0-23 based hour with at least 2 digits. If less, it is padded with a zero. 5 PM → "17"  7 AM → "07"
 
 //////////////// MINUTES ////////////////////////
 
 "m"    A minute with at least 1 digit.  40 → "40"  1 → "1"
 
 "mm" A minute with at least 2 digits.  If less, it is padded with a zero.  40 → "40"  1 → "01"
 
 //////////////// SECONDS ////////////////////////
 
 "s"    A second with at least 1 digit. 40 → "40"  1 → "1"
 
 "ss" A second with at least 2 digits. If less, it is padded with a zero. 40 → "40"  1 → "01"
 
 "S"    Tenths place of fractional second. 123 ms → "1"   7 ms → "0"
 
 "SS" Tenths and hundredths place of a fractional second.  123 ms → "12"  7 ms → "00"
 
 "SSS" Tenths, hundredths, and thousandths place of a fractional second. 123 ms → "123"  7 ms → "007"
 
 */