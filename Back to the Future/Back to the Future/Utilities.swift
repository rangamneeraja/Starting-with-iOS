//
//  Utilities.swift
//  Back to the Future
//
//  Created by neerajar on 30/01/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import Foundation

class Utilities {
    
    func getCurrentYear () ->String {
        let date = Date()
        let calender = Calendar.current
        return String(calender.component(.year, from: date))
    }
    
    
    func getLetterAtIndex (str: String, location: Int)->String {
        
        let index = str.index(str.startIndex, offsetBy: location)
        return String(str[index])
    }
    
    func getCurrentTime() ->String {
        let date = Date()
        let formatter = DateFormatter()
        //formatter.dateStyle = .none
        //formatter.dateStyle = .medium
        //formatter.locale = Locale(identifier: "en_US_POSIX")        //optional
        formatter.dateFormat = "HH:mm:ss a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        let timeString = formatter.string(from: date)
        
        return timeString
    }
    
    func getRandomYear() ->String {
        return String(arc4random_uniform(8999) + 1000)
    }
    
}
