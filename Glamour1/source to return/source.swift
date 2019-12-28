//
//  source.swift
//  Glamour1
//
//  Created by mac book on 12/13/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import Foundation
import Firebase

class sourcess{
          func wes(){
            Database.database().reference().child("Products").queryOrdered(byChild: "prouduct_name").queryEqual(toValue: "flormal lipstick").observeSingleEvent(of: .value, with: { (snapshot) in
              let currentUser = Auth.auth().currentUser?.uid
                if !snapshot.exists() {
                    print("No data found")
                    return
                }
                var rooms = snapshot.value as! [String:AnyObject]
                let roomKeys = Array(rooms.keys)
                for roomKey in roomKeys  {
                    guard
                        let value = rooms[roomKey] as? [String:AnyObject]
                        else
                    {
                        continue
                    }
    //                let title = value["title"] as? String
    //                let description = value["description"] as? String
    //                let roomPictureUrl = value["Room Picture"] as? String
    //                let longitude = value["Longtitude"] as? String
    //                let latitude = value["Latitude"] as? String
    //                let dateFrom = value["Date From"] as? String
    //                let dateTo = value["Date To"] as? String
    //                let owner = value["Owner"] as? String
    //                let myRooms = Room(roomID: roomKey,title: title!, description: description!, roomPicutreURL: roomPictureUrl!, longitude: longitude!, latitude: latitude!, dateFrom: dateFrom!, dateTo: dateTo!, owner: owner!)
    //
    //                self.rooms.append(myRooms)
    //                self.tableView.reloadData()
                    print(snapshot.value)

                }
            })
            
            
        }
    
    
    func Search_for_Data(){
        Database.database().reference().child("Products").queryOrdered(byChild: "prouduct_name").queryEqual(toValue: "flormal lipstick").observeSingleEvent(of: .value, with: { (snapshot) in
                 let currentUser = Auth.auth().currentUser?.uid
                   if !snapshot.exists() {
                       print("No data found")
                       return
                   }
                   var productt = snapshot.value as! [String:AnyObject]
                    print("mohammedwa\(productt)")
                   let ProuductsKey = Array(productt.keys)
                   for product in ProuductsKey  {
                       guard
                           let dic = productt[product] as? [String:AnyObject]
                           else
                       {
                           continue
                       }
                    
                        }
                    })
    }
}
