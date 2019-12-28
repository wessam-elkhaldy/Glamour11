//
//  Firebase.swift
//  Glamour1
//
//  Created by mac book on 12/5/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import Foundation
import Firebase
import UIKit

class FirebaseRealTime{
    
    static func AddUserToDatabaseFacebook(email : String , username : String , UrlImge : String? , uid : String  , complition : (()->())){
            
        let dic = ["email" : email , "username" : username , "UrlImge" : UrlImge , "uid" : uid]
        
        Database.database().reference().child("Users").child(uid).child("info_Personal").setValue(dic) { (Error, DatabaseReference) in
            if Error != nil {
                print(Error?.localizedDescription)
            }
            else{
                
                print("Add user is sucsses")
                

//                complition()
            }
            
        }
        
    }
}
