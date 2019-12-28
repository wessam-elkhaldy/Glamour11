//
//  String.swift
//  Glamour1
//
//  Created by mac book on 12/16/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import Foundation
extension String {
    
    
    func toDate(withFormat format: String = "yyyy-MM-dd HH:mm:ss")-> Date?{
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tehran")
        dateFormatter.locale = Locale(identifier: "fa-IR")
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        
        return date
        
    }
    
}

    extension Double {
        func dateFromMilliseconds(format:String) -> Date {
            let date : NSDate! = NSDate(timeIntervalSince1970:Double(self) / 1000.0)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = format
            dateFormatter.timeZone = TimeZone.current
            let timeStamp = dateFormatter.string(from: date as Date)

let formatter = DateFormatter()
            formatter.dateFormat = format
            return ( formatter.date( from: timeStamp ) )!
        }
    }

