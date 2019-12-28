//
//  class_firebase.swift
//  Glamour1
//
//  Created by mac book on 12/17/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import Foundation
import Firebase

class fire_base{
    
    static func add_like(random_String: String , sender : UIButton){
        if sender.isSelected{
                 sender.isSelected = false
                 Search_for_Data(random_String: random_String , status : false)

             }else{
                 sender.isSelected = true
                 Search_for_Data(random_String: random_String , status : true)
             }  
    }
    
  static  func Search_for_Data(random_String : String , status : Bool){
        Database.database().reference().child("Posts").queryOrdered(byChild: "random_String").queryEqual(toValue: random_String).observeSingleEvent(of: .value, with: { (snapshot) in
                 let currentUser = Auth.auth().currentUser?.uid
                   if !snapshot.exists() {
                       print("No data found")
                       return
                   }
            let chile = snapshot as! DataSnapshot
            let dic = snapshot.value as! [String:Any]
//            print(self.key)
            var key_of_post = ""
            for key in dic.keys{
                key_of_post += key
            }
        self.add_to_fav(key_of_post: key_of_post , status : status)
                    })
    }
    
         static  func add_to_fav(key_of_post : String , status : Bool){
               guard let user_profile = UserServices.CurrentUser else {
                   print("eeeerrrrorrroror")
                   return
                   }
    Database.database().reference().child("Posts").child(key_of_post).child("User_Likes_Posts").child(user_profile.uid).setValue(status) { (Error, DatabaseReference) in
                   if Error != nil {
                       print(Error?.localizedDescription)

                   }
                   else{
                    if status{
                       print("Add like is done")
                    }
                    else{
                        print("delete like is done")
                    }
                   }
               }
           }
    
}
