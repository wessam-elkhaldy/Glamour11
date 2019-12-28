//
//  Add_Comment_VC.swift
//  Glamour1
//
//  Created by mac book on 12/15/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage
class Add_Comment_VC: UIViewController {
    @IBOutlet weak var Comment_TF : UITextField!
    @IBOutlet weak var TV : UITableView!
    var key_who_like_posts : [String] = []
    var key : [String] = []
    var postcomment : [PostsComment] = []
    var post_key = ""
    var random_String : String?{
        didSet{
            print("okk")
            Search_for_comment(random_String : random_String!)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        TV.dataSource = self

    }
        @IBAction func comment_button(sender : UIButton){
//        Search_for_comment(random_String : random_String!)
            
            self.add_comment_to_firebase(post_key: self.post_key)

        }
    func get_All_comments(){
        let ref = Database.database().reference().child("Posts").child(post_key).child("User_Comments_Posts")
                       ref.observe(.value) { (DataSnapshot) in
                           self.postcomment.removeAll()
                           for  child in DataSnapshot.children {
                               let ChildSnapshot = child as? DataSnapshot
                               let dic = ChildSnapshot?.value as? [String:Any]
                               let author = dic!["author"] as? [String:Any]
                               let username = author!["username"] as? String
                               let email = author!["email"] as? String
                               let urlimge = author!["UrlImge"] as? String
                               let uidd = author!["uid"] as? String
                               let Commenet_text = dic!["Commenet_text"] as? String
                               let timestamp = dic!["timestamp"] as? Double
                                   let user_profile = User(dice: author as! [String : String])
                           let postcomm = PostsComment(uid: ChildSnapshot!.key, author: user_profile, Commenet_text: Commenet_text!, timestamp: timestamp!)
                            self.postcomment.append(postcomm)
                               print(ChildSnapshot!.key)
                            print("okk")
                               self.TV.reloadData()
                           }
                        print(self.postcomment.count)
        }}
    
    
    
    func Search_for_comment(random_String : String){
        Database.database().reference().child("Posts").queryOrdered(byChild: "random_String").queryEqual(toValue: random_String).observeSingleEvent(of: .value, with: { (snapshot) in
                 let currentUser = Auth.auth().currentUser?.uid
                   if !snapshot.exists() {
                       print("No data found")
                       return
                   }
            let chile = snapshot as! DataSnapshot
            let dic = snapshot.value as! [String:Any]
            var random_string = ""
            for key in dic.keys{
                self.post_key += key
            }
            self.get_All_comments()
            self.get_All_Likes()
            
        })
    }

    
           func add_comment_to_firebase(post_key : String){
               guard let user_profile = UserServices.CurrentUser else {
                   print("NO User Now")
                
                   return
                   }
            let dic = ["Commenet_text": Comment_TF.text , "author" : ["username":user_profile.username , "UrlImge" : user_profile.UrlImge , "email" : user_profile.email , "uid" : user_profile.uid] , "timestamp" : [".sv" : "timestamp"] ] as [String : Any]
            
            Database.database().reference().child("Posts").child(post_key).child("User_Comments_Posts").childByAutoId().setValue(dic) { (Error, DatabaseReference) in
                   if Error != nil {
                       print(Error?.localizedDescription)

                   }
                   else{
                       print("successs")
                    self.get_All_comments()

                   }
               }
    }
    
    func get_All_Likes(){
        print(post_key)

        Database.database().reference().child("Posts").child(post_key).child("User_Likes_Posts").observe(DataEventType.value, with: { (snapshot) in
              let postDict = snapshot.value as? [String : AnyObject] ?? [:]
                print(postDict)
            print(postDict.keys)
            for postlike in postDict{
                if postlike.value as! Bool == true{
                    print(postlike.key)
                    self.key_who_like_posts.append(postlike.key)
                }
            }
            print("123")
            print(self.key_who_like_posts)
            self.TV.reloadData()
            self.get_All_User_who_like()
        
            })
    }
     
    func get_All_User_who_like(){
        for user_likes in key_who_like_posts { Database.database().reference().child("Users").child(user_likes).child("info_Personal").observe(DataEventType.value, with: { (snapshot) in
                  let likeDict = snapshot.value as? [String : AnyObject] ?? [:]
                    print(likeDict)
                let username = likeDict["username"] as! String
                let imageuser = likeDict["UrlImge"] as! String
                print("123")
                print(self.key_who_like_posts)
                self.TV.reloadData()
            
                })
        }}
    
    
    }

extension Add_Comment_VC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postcomment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post_comm = postcomment[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Add_Comment_Cell") as! Add_Comment_Cell
        cell.personal_imge.sd_setImage(with: URL(string: post_comm.author!.UrlImge), completed: nil)
        cell.name.text = post_comm.author?.username
        cell.comment_text.text = post_comm.Commenet_text
            let date = post_comm.timestamp?.dateFromMilliseconds(format: "yyyy-MM-dd'T'HH:mm:ss'Z'")
            var dateString = date?.timeAgoSinceDate()
        cell.time_label.text = dateString
        
        return cell
    }
    
    
    
}


        
    
        
        
        
    

