//
//  NewPostsVC.swift
//  Glamour1
//
//  Created by mac book on 12/8/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import UIKit
import Firebase
class NewPostsVC: UIViewController {

    @IBOutlet weak var mytextView : UITextField!
    @IBOutlet weak var Palceholder_Label : UILabel!
    @IBOutlet weak var Done : UIButton!
    @IBOutlet weak var comments : UITextField!
    @IBOutlet weak var Personal_name : UILabel!
    @IBOutlet weak var Personal_photo : UIImageView!


    var posts : [Posts]=[]
    
    @IBAction func add_post(sender : UIButton ){
        if sender.tag == 0{
            hundle_post()
        }
        if sender.tag == 1{
                 hundleComment()
             }
        //        hundle_post2()
    }
    
    func LoadUserData(){
        guard let user = UserDefaultHelper.loadUser()
          else {
            return
        }
      Personal_name.text = user.username
      Personal_photo.sd_setImage(with: URL(string: user.UrlImge), completed: nil)
      print(user.username)
      print(user.email)
      
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
            print("wessam")
            print(randomString(length: 10))
            print(randomString(length: 10))
            print(randomString(length: 10))
        LoadUserData()
        hideKeyboardWhenTappedAround()

    }
    
    func hundle_post(){
        
        guard let user_profile = UserServices.CurrentUser else {
            print("No user")
            return
        }
        
        
      let postref = Database.database().reference().child("Posts").childByAutoId()
              let random_String = randomString(length: 10)
        let text_object = ["author": ["username":user_profile.username , "UrlImge" : user_profile.UrlImge , "email" : user_profile.email , "uid" : user_profile.uid] ,"texts" : mytextView.text! ,"random_String" : random_String, "timestamp" : [".sv" : "timestamp"]] as [String : Any]
        postref.setValue(text_object) { (Error, DatabaseReference) in
            if Error != nil {
//                self.dismiss(animated: true, completion: nil)
                print(Error?.localizedDescription)
            }else{
                print("add post done")
                let post_reff = postref.key as? String
                print("post_refrendee= \(postref)")
                let dicc = ["posts_key": post_reff]
                Database.database().reference().child("Users").child(user_profile.uid).child("Users_posts").childByAutoId().setValue(dicc)
                
            }
            
        }
    }
    
    func hundleComment(){
          guard let user_profile = UserServices.CurrentUser else {
                  return
              }
        let comments = ["author" : ["username":user_profile.username , "UrlImge" : user_profile.UrlImge , "email" : user_profile.email , "uid" : user_profile.uid] , "commentText" : "welcvome" , "timestamp" :  [".sv" : "timestamp"]] as [String : Any]
        let postref = Database.database().reference().child("Posts").child("-LvgJJzKX-DdzttFiiM_").child("Comments").childByAutoId()
          
          postref.setValue(comments) { (Error, DatabaseReference) in
              if Error == nil {
                  print("Add comment is done")
              }
          }
          
      }
    
    
    
  
    
    func ObservePosts(){
        let ref = Database.database().reference().child("Posts")
        ref.observe(.value) { (DataSnapshot) in
            for  child in DataSnapshot.children {
                if let ChildSnapshot = child as? DataSnapshot , let dic = ChildSnapshot as? [String:Any] ,let author = dic["author"] as? [String:Any],let random_String = dic["random_String"] as? String, let number_of_comments = dic["number_of_comments"] as? String , let number_of_Likes = dic["number_of_Likes"] as? String ,let username = author["username"] as? String , let email = author["email"] as? String , let urlimge = author["UrlImge"] as? String , let uidd = author["uid"] as? String , let text = dic["texts"] as? String , let timestamp = dic["timestamp"] as? Double{
                    
                    let user_profile = User(dice: dic as! [String : String])
                    let post = Posts(uid: ChildSnapshot.key, author: user_profile, text: text , timestamp: timestamp, random_String: random_String, number_of_Likes: number_of_Likes, number_of_comments: number_of_comments)
                    
                    self.posts.append(post)
                }
            }
//            tv.reloaddat()
        }
    }
    
    func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    
}
