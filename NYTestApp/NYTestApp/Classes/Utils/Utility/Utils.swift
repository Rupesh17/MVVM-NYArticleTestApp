//
//  Utils.swift
//  NYTestApp
//
//  Created by Rupesh Kumar on 27/06/18.
//  Copyright © 2018 Rupesh Kumar. All rights reserved.
//

import Foundation

class Utils
{
    static func getDateFromString(dateString:String) -> NSDate?
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DD"
        guard let date = dateFormatter.date(from:dateString) else {
            NSLog("Date conversion failed due to mismatched format.")
            return NSDate()
        }
        return date as NSDate
    }
    
    static func getStringFromDate(date:Date) -> String?
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DD" //Your New Date format as per requirement change it own
        let newDate = dateFormatter.string(from: date) //pass Date here
        return newDate //New formatted Date string
    }
}

