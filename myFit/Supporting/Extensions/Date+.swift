//
//  Date+.swift
//  myFit
//
//  Created by Winston Maragh on 9/19/18.
//  Copyright © 2018 Winston Maragh. All rights reserved.
//

import Foundation


extension Date {
    var age: Int {
        return Calendar.current.dateComponents([.year], from: self, to: Date()).year!
    }
}

extension Date {
    
    // get month of current date
    var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    
    /// Returns a day int for the date.
    var day: Int {
        return Calendar.current.component(.day, from: self)
    }
    
    // get year of current date
    var year: Int {
        return Calendar.current.component(.year, from: self)
    }
    
    // get hour of current date
    var hour: Int {
        get {
            return Calendar.current.component(.hour, from: self)
        }
        set {
            let allowedRange = Calendar.current.range(of: .hour, in: .day, for: self)!
            guard allowedRange.contains(newValue) else { return }
            
            let currentHour = Calendar.current.component(.hour, from: self)
            let hoursToAdd = newValue - currentHour
            if let date = Calendar.current.date(byAdding: .hour, value: hoursToAdd, to: self) {
                self = date
            }
        }
    }
    
    // get minute of current date
    public var minute: Int {
        get {
            return Calendar.current.component(.minute, from: self)
        }
        set {
            let allowedRange = Calendar.current.range(of: .minute, in: .hour, for: self)!
            guard allowedRange.contains(newValue) else { return }
            let currentMinutes = Calendar.current.component(.minute, from: self)
            let minutesToAdd = newValue - currentMinutes
            if let date = Calendar.current.date(byAdding: .minute, value: minutesToAdd, to: self) {
                self = date
            }
        }
    }
    
    
    // Returns a day name string from the date.
    var dayName: String {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("EEE")
        return dateFormatter.string(from: self)
    }
    
    // Returns a month name string from the date.
    var monthName: String {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("MMM")
        return dateFormatter.string(from: self)
    }
    
    // Returns a date string from the date.
    func dateString(for style: DateFormatter.Style = .medium) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = style
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }
    
    // Checks if a date is within the current date day.
    func isInCurrentDayWith(_ date: Date) -> Bool {
        return Calendar.current.isDate(self, equalTo: date, toGranularity: .day)
    }
    
    // Checks if a date is within the current date month.
    func isInCurrentMonthWith(_ date: Date) -> Bool {
        return Calendar.current.isDate(self, equalTo: date, toGranularity: .month)
    }
    
    // Returns a new date by adding the calendar component value.
    func adding(_ component: Calendar.Component, value: Int) -> Date? {
        return Calendar.current.date(byAdding: component, value: value, to: self)
    }
}
