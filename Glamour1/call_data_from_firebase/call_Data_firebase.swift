//
//  call_Data_firebase.swift
//  Glamour1
//
//  Created by mac book on 12/8/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class call_data{
    var Products : [product] = []
    
    
//    func getBrandData(Table : UITableView , viewcontroller : UIViewController ) -> [product]{
//
//        Database.database().reference().child("Products").observeSingleEvent(of: .value) { (dataSnapshot) in
//
//
//            self.Products.removeAll()
//
//            for result in dataSnapshot.children{
//                let snapShot = result as! DataSnapshot
//                var dic  = snapShot.value as! [String : Any]
//                dic["key"] = snapShot.key
//
//
//                let prodouct = product(dic: dic as! [String : String])
//                print(dic)
//                self.Products.append(prodouct)
//            }
//
//            self.Table.reloadData()
//
//            return Products
//        }
//    }
    
     //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//    func koasg(){
//        guard let uid = Auth.auth().currentUser?.uid else {
//            return
//        }
//        let ref = Database.database().reference().child("Posts").child(uid)
//        ref.observe(.value) { (DataSnapshot) in
//            for  child in DataSnapshot.children {
//
//                let ChildSnapshot = child as? DataSnapshot
//                let dic = ChildSnapshot?.value as? [String:Any]
//                let author = dic!["author"] as? [String:Any]
//                let username = author!["username"] as? String
//                let email = author!["email"] as? String
//                let urlimge = author!["UrlImge"] as? String
//                let uidd = author!["uid"] as? String
//                let text = dic!["texts"] as? String
//                let timestamp = dic!["timestamp"] as? Double
//                    let user_profile = User(dice: author as! [String : String])
//                let post = Posts(uid: ChildSnapshot!.key, author: user_profile, text: text! , timestamp: timestamp!)
//
//                    self.posts.append(post)
//                    print(post.text)
//                print(ChildSnapshot!.key)
//
//
//                self.TV.reloadData()
//
//            }
//            print(self.posts.count)
//            print(self.posts.count)
//
//        }
//
//    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//    func ObservePosts2(){
//        guard let user_profile = UserServices.CurrentUser else {
//             return
//         }
//
//
//        let ref = Database.database().reference().child("Posts").child(user_profile.uid)
//        ref.observe(.value) { (DataSnapshot) in
//            for  child in DataSnapshot.children {
//
//                let ChildSnapshot = child as? DataSnapshot
//                let dic = ChildSnapshot?.value as? [String:Any]
//                let author = dic!["author"] as? [String:Any]
//                let username = author!["username"] as? String
//                let email = author!["email"] as? String
//                let urlimge = author!["UrlImge"] as? String
//                let uidd = author!["uid"] as? String
//                let text = dic!["texts"] as? String
//                let timestamp = dic!["timestamp"] as? Double
//                    let user_profile = User(dice: author as! [String : String])
//                let post = Posts(uid: ChildSnapshot!.key, author: user_profile, text: text! , timestamp: timestamp!)
//
//                    self.posts.append(post)
//                    print(post.text)
//                print(ChildSnapshot!.key)
//
//
//                self.TV.reloadData()
//
//            }
//            print(self.posts.count)
//            print(self.posts.count)
//
//        }
//
//    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//        func ObservePosts(){
//            let ref = Database.database().reference().child("Posts")
//            ref.observe(.value) { (DataSnapshot) in
//                for  child in DataSnapshot.children {
//                    let child = DataSnapshot as! DataSnapshot
//                    print(child.key)
//                    if let ChildSnapshot = child as? DataSnapshot , let dic = ChildSnapshot.value as? [String:Any] ,let author = dic["author"] as? [String:Any],let username = author["username"] as? String , let email = author["email"] as? String , let urlimge = author["Urlimge"] as? String , let uidd = author["uid"] as? String , let text = dic["texts"] as? String , let timestamp = dic["timestamp"] as? Double{
//
//                        let user_profile = User(dice: dic as! [String : String])
//                        let post = Posts(uid: ChildSnapshot.key, author: user_profile, text: text , timestamp: timestamp)
//
//                        self.posts.append(post)
//                        print(post.text)
//                        print(ChildSnapshot.key)
//
//                    }
//                    self.TV.reloadData()
//
//                }
//                print(self.posts.count)
//                print(self.posts.count)
//
//            }
//    }


    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


    //
    //            Database.database().reference().child("Posts").observeSingleEvent(of: .value) { (dataSnapshot) in
    //
    //                for  child in dataSnapshot.children {
    //                    let child = dataSnapshot as! DataSnapshot
    //                    print(child.key)
    //                    if let ChildSnapshot = child as? DataSnapshot , let dic = ChildSnapshot as? [String:Any] ,let author = dic["author"] as? [String:Any],let username = author["username"] as? String , let email = author["email"] as? String , let urlimge = author["UrlImge"] as? String , let uidd = author["uid"] as? String , let text = dic["texts"] as? String , let timestamp = dic["timestamp"] as? Double{
    //
    //                        let user_profile = User(dice: dic as! [String : String])
    //                        let post = Posts(uid: ChildSnapshot.key, author: user_profile, text: text , timestamp: timestamp)
    //
    //                        self.posts.append(post)
    //                        print(post.text)
    //                        print(ChildSnapshot.key)
    //                    }
    //
    //                }
    //
    //            }

    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    // personal page vc
        func Search_for_Data(product_name : String , status : Bool){
            guard let uid = Auth.auth().currentUser?.uid as? String else {
                return
            }

    //        Database.database().reference().child("Posts").child("author").queryOrdered(byChild: "uid").queryEqual(toValue:uid).observeSingleEvent(of: .value, with: { (snapshot) in
    //                   if !snapshot.exists() {
    //                       print("No data found")
    //                       return
    //                   }
    //            let dic = snapshot.value as! [String:Any]
    //            var x = dic.keys
    //          print(dic.keys)
    //            print(snapshot.key.description)
    //                   var productt = snapshot.value as! [String:AnyObject]
    //            self.add_to_fav(key: "-LvknvWZFleD7ynyiAQK" , status : status)
    //            print("mohammedwa\(productt.keys)")
//    Database.database().reference().child("Posts").child("author").queryOrdered(byChild: "uid").queryEqual(toValue: uid).observeSingleEvent(of: .value) { (DataSnapshot, String) in
//                       if !DataSnapshot.exists() {
//                                print("No data found")
//                                           return
//                                      }
//                }
//        }
//
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            
            // create post
            /// for test just
//                func hundle_post2(){
//
//                    guard let user_profile = UserServices.CurrentUser else {
//                        return
//                    }
//
//                    let postref = Database.database().reference().child("Posts").child(user_profile.uid).childByAutoId()
//
//                    let text_object = ["author": ["username":user_profile.username , "UrlImge" : user_profile.UrlImge , "email" : user_profile.email , "uid" : user_profile.uid] ,"texts" : mytextView.text! , "timestamp" : [".sv" : "timestamp"]] as [String : Any]
//
//                    postref.setValue(text_object) { (Error, DatabaseReference) in
//                        if Error != nil {
//            //                self.dismiss(animated: true, completion: nil)
//                            print(Error?.localizedDescription)
//                        }else{
//                            print("add post done")
//                        }
//
//                    }
//
//                }
            
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            
            
            //// ////  / // // / /  oooo fffff iiiiii ccccc  aaaa lllllll
//                func hundle_post(){
//
//                    guard let user_profile = UserServices.CurrentUser else {
//                        return
//                    }
//
//
//                  let postref = Database.database().reference().child("Posts").childByAutoId()
//
//                    let text_object = ["author": ["username":user_profile.username , "UrlImge" : user_profile.UrlImge , "email" : user_profile.email , "uid" : user_profile.uid] ,"texts" : mytextView.text! , "timestamp" : [".sv" : "timestamp"]] as [String : Any]
//                    postref.setValue(text_object) { (Error, DatabaseReference) in
//                        if Error != nil {
//            //                self.dismiss(animated: true, completion: nil)
//                            print(Error?.localizedDescription)
//                        }else{
//                            print("add post done")
//                            let post_reff = postref.key as? String
//                            print("post_refrendee= \(postref)")
//                            let dicc = ["posts_key": post_reff]
//                            Database.database().reference().child("Users").child(user_profile.uid).child("Users_posts").childByAutoId().setValue(dicc)
//
//                        }
//
//                    }
//                }
            
//            func koasg(){
//                let ref = Database.database().reference().child("Posts")
//                ref.observe(.value) { (DataSnapshot) in
//                    for  child in DataSnapshot.children {
//
//                        let ChildSnapshot = child as? DataSnapshot
//                        let dic = ChildSnapshot?.value as? [String:Any]
//                        let author = dic!["author"] as? [String:Any]
//                        let username = author!["username"] as? String
//                        let email = author!["email"] as? String
//                        let urlimge = author!["UrlImge"] as? String
//                        let uidd = author!["uid"] as? String
//                        let text = dic!["texts"] as? String
//                        let timestamp = dic!["timestamp"] as? Double
//                            let user_profile = User(dice: author as! [String : String])
//                        let post = Posts(uid: ChildSnapshot!.key, author: user_profile, text: text! , timestamp: timestamp!)
//
//                            self.posts.append(post)
//                            print(post.text)
//                        print(ChildSnapshot!.key)
//
//
//                        self.TV.reloadData()
//
//                    }
//                    print(self.posts.count)
//                    print(self.posts.count)
//
//                }
//
            ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
           // }
            //    func Search_for_comment(random_String : String){
            //        Database.database().reference().child("Posts").queryOrdered(byChild: "random_String").queryEqual(toValue: random_String).observeSingleEvent(of: .value, with: { (snapshot) in
            //                 let currentUser = Auth.auth().currentUser?.uid
            //                   if !snapshot.exists() {
            //                       print("No data found")
            //                       return
            //                   }
            //            let chile = snapshot as! DataSnapshot
            //            let dic = snapshot.value as! [String:Any]
            //            print(self.key)
            //            var random_string = ""
            //            for key in dic.keys{
            //                random_string += key
            //            }
            //            self.add_comment(random_String: random_string)
            //        })
            //    }
            //           func add_comment_to_firebase(random_String : String){
            //               guard let user_profile = UserServices.CurrentUser else {
            //                   print("eeeerrrrorrroror")
            //                   return
            //                   }
            //            let dic = ["Commenet_text":comment_tf.self , "author" : ["username":user_profile.username , "UrlImge" : user_profile.UrlImge , "email" : user_profile.email , "uid" : user_profile.uid] , "timestamp" : [".sv" : "timestamp"] ] as [String : Any]
            //
            //            Database.database().reference().child("Posts").child(random_String).child("User_Comments_Posts").childByAutoId().setValue(dic) { (Error, DatabaseReference) in
            //                   if Error != nil {
            //                       print(Error?.localizedDescription)
            //
            //                   }
            //                   else{
            //                       print("successs")
            //                   }
            //               }
            //           }
            }

            //extension The_Mainpage_VC : comment_tf{
            //
            //    func CommentTF(commentTF: String) {
            //        comment = commentTF
            //    }
            //
            //}

    //                   let email =  Auth.auth().currentUser?.email
    //                   let name =   Auth.auth().currentUser?.displayName
    //                   let uid =    Auth.auth().currentUser?.uid
    //                   let photourl =  Auth.auth().currentUser?.photoURL
                        //let email =  Auth.auth().currentUser?.email
                        //let name =   Auth.auth().currentUser?.displayName
    //                    print(Auth.auth().currentUser?.email)

    }

