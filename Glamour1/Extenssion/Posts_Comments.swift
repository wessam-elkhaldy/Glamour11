//
//  User_Comments.swift
//  Glamour1
//
//  Created by mac book on 12/16/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import Foundation
class PostsComment : Codable{
        var uid : String?
        var Commenet_text : String?
        var author : User?
        var timestamp : Double?
        
        init(uid : String , author : User , Commenet_text : String , timestamp : Double){
            
            self.uid = uid
            self.author = author
            self.timestamp = timestamp
            self.Commenet_text = Commenet_text
        }
}
