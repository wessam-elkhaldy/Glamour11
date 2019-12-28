//
//  extenssion.swift
//  Glamour1
//
//  Created by mac book on 11/26/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import Foundation
import UIKit
extension UIView{
    @IBInspectable var corredious : CGFloat {
        set{
            layer.cornerRadius = newValue
        }
        get{
            return layer.cornerRadius
        }
    }
    @IBInspectable var bordercolor : UIColor {
        set{
            layer.borderColor = newValue.cgColor
        }
        get{
            return  UIColor(cgColor: self.layer.borderColor!)
        }
    }
    @IBInspectable var borderwidth : CGFloat {
        set{
            layer.borderWidth = newValue

        }
        get{
            return layer.borderWidth
        }

    }
    @IBInspectable var backgroungcolor : UIColor{
        set{
            layer.backgroundColor = newValue.cgColor
        }
        get{
            return UIColor(cgColor: self.layer.backgroundColor!)
        }
    }
}
    
extension Date {
func timeAgoDisplay() -> String {
        let secondsAgo = Int(Date().timeIntervalSince(self))

        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        let month = 4 * week
        let year = 12 * month

        if secondsAgo < minute  {
            print("\(secondsAgo)s ago")
            return "\(secondsAgo)s ago"
        } else if secondsAgo < hour {
            return "\(secondsAgo)m ago"
        } else if secondsAgo < day {
            return "\(secondsAgo)hr ago"
        } else if secondsAgo < week {
            return "\(secondsAgo)d ago"
        } else if secondsAgo < month {
            return "\(secondsAgo)w ago"
        } else if secondsAgo < year {
            return "\(secondsAgo)mo ago"
        }
        return "\(secondsAgo)yr ago"
}
}
