//
//  UserDefaultHelper.swift
//  Glamour1
//
//  Created by mac book on 12/5/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import Foundation
import UIKit
class UserDefaultHelper{
    
    
    static func isLogin()->Bool{
        print("is logih")
        print(loadUser()==nil)

        return loadUser() != nil
    }
    
    //save user defalt
    
    static func saveUser(user :User){
        

        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "Saveduser")
        }
//
        
    }
    
    
    static func loadUser() -> User?{

        
        if let savedPerson = UserDefaults.standard.object(forKey: "Saveduser") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(User.self, from: savedPerson) {
                print(loadedPerson.email)
                return loadedPerson

            }
        }
        return nil
    }
    
    static func DeleteUser(){
        UserDefaults.standard.removeObject(forKey: "Saveduser")
    }
    
}
