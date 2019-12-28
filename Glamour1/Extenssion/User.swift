//
//  User.swift
//  Glamour1
//
//  Created by mac book on 12/5/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import Foundation
class User : Codable{
    var email : String = ""
    var username : String = ""
    var uid : String = ""
    var UrlImge : String = ""
    
    init(dice : [String:String] ) {
        email = dice["email"]!
        username = dice["username"]!
        uid = dice["uid"]!
        UrlImge = dice["UrlImge"]!

    }
}
