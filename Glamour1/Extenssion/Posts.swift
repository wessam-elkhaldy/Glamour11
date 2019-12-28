//
//  Posts.swift
//  Glamour1
//
//  Created by mac book on 12/8/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import Foundation
class Posts{
    
    var uid : String?
    var text : String?
    var author : User?
    var timestamp : Double?
    var  random_String : String?
    var number_of_comments : String?
    var number_of_Likes : String?
    
//    let random_String = dic!["random_String"] as? String

    
    
    init(uid : String , author : User , text : String , timestamp : Double , random_String : String? , number_of_Likes : String? , number_of_comments : String? ){
        
        self.uid = uid
        self.author = author
        self.text = text
        self.timestamp = timestamp
        self.random_String = random_String
        self.number_of_comments = number_of_comments
        self.number_of_Likes = number_of_Likes
    }
}
