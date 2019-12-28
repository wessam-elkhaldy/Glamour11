//
//  user_services.swift
//  Glamour1
//
//  Created by mac book on 12/8/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import Foundation
import Firebase

class UserServices{
    static var CurrentUser : User?
    
    static func ObserveUserProfile(uid : String , compeltion : @escaping ((_ userprofile : User?) -> ())){
        
        let ref = Database.database().reference().child("Users/\(uid)/info_Personal")
        ref.observe(.value) { (DataSnapshot) in
            var UserProfile : User?
            
            if let dic = DataSnapshot.value as? [String:Any], let username = dic["username"] as? String , let email = dic["email"] as? String , let urlimge = dic["UrlImge"] as? String , let uidd = dic["uid"] as? String {
                UserProfile = User(dice: dic as! [String : String])
            }
            compeltion(UserProfile)
        }
        
    }
    
}
