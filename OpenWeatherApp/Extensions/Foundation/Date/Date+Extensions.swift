//
//  Date+Extensions.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import Foundation

enum DateFormat: String {
    case server = "yyyy-MM-dd HH:mm:ss"
    case standard = "MM/dd/yyyy"
    case dateTime = "MM-dd-yyyy hh:mm"
    case display = "MMM d yyyy, hh:mm a"
    case monthYear = "MMM, yyyy"
}

extension Date {
    
    public var year: Int {
        return Calendar.current.component(.year, from: self)
    }
    
    public var isLeapYear: Bool {
        let year = self.year
        return ( (year % 100 != 0) && (year % 4 == 0) ) || year % 400 == 0
    }
    
    public var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    
    public var weekDay: Int {
        return Calendar.current.component(.weekday, from: self)
    }
    
    public var weekDayFromMonday: Int {
        var day = self.weekDay - 2
        if day < 0 {
            day = 6
        }
        return day
    }
    
    public var week: Int {
        return Calendar.current.component(.weekOfYear, from: self)
    }
    
    public var day: Int {
        return Calendar.current.component(.day, from: self)
    }
    
    public var hour: Int {
        return Calendar.current.component(.hour, from: self)
    }
    
    public var minute: Int {
        return Calendar.current.component(.minute, from: self)
    }
    
    public var second: Int {
        return Calendar.current.component(.second, from: self)
    }
    
    public var quarter: Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "Q"
        return Int(dateFormatter.string(from: self))!
    }
    
    /**
     Returns the distance in years from a given Date object (uses the current calendar)
     
     - parameter from date: The date to calculate the distance from
     - returns: Distance in years
     */
    public func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: self, to: date).year!
    }
    
    /**
     Returns the distance in months from a given Date object (uses the current calendar)
     
     - parameter from date: The date to calculate the distance from
     - returns: Distance in months
     */
    public func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: self, to: date).month!
    }
    
    /**
     Returns the distance in weeks from a given Date object (uses the current calendar)
     
     - parameter from date: The date to calculate the distance from
     - returns: Distance in weeks
     */
    public func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfYear], from: self, to: date).weekOfYear!
    }
    
    /**
     Returns the distance in days from a given Date object (uses the current calendar)
     
     - parameter from date: The date to calculate the distance from
     - returns: Distance in days
     */
    public func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: self, to: date).day!
    }
    
    /**
     Returns the distance in hours from a given Date object (uses the current calendar)
     
     - parameter from date: The date to calculate the distance from
     - returns: Distance in hours
     */
    public func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: self, to: date).hour!
    }
    
    /**
     Returns the distance in minutes from a given Date object (uses the current calendar)
     
     - parameter from date: The date to calculate the distance from
     - returns: Distance in minutes
     */
    public func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: self, to: date).minute!
    }
    
    /**
     Returns the distance in seconds from a given Date object (uses the current calendar)
     
     - parameter from date: The date to calculate the distance from
     - returns: Distance in seconds
     */
    public func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: self, to: date).second!
    }
    
    func to(to newFormat: DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = newFormat.rawValue
        return dateFormatter.string(from: self)
    }
    
    var currentTimeRange: String {
        let calender = Calendar.current
        let comps = calender.dateComponents([.hour], from: self)
        let hour = comps.hour ?? 0
        switch hour {
        case 0 ... 12:
            return "morning".localized()
        case 13 ... 17:
            return "afternoon".localized()
        default:
            return "evening".localized()
        }
    }
}

