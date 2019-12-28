//
//  get_User_likesVC.swift
//  Glamour1
//
//  Created by mac book on 12/16/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

struct user_who_likes {
    var name : String?
    var imageurl : String?
}

class get_User_likesVC: UIViewController {

    @IBOutlet weak var TV : UITableView!
    var post_key = ""
    var key_who_like_posts : [String] = []
    var user_who_like : [user_who_likes] = []
    var random_String : String?{
        didSet{
            print("okk")
            Search_for_Likes(random_String : random_String!)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        TV.dataSource = self
        
    }
    
    func Search_for_Likes(random_String : String){
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
            self.get_All_Likes()
            
        })
    }
    
    func get_All_Likes(){
        print(post_key)
        key_who_like_posts.removeAll(); Database.database().reference().child("Posts").child(post_key).child("User_Likes_Posts").observe(DataEventType.value, with: { (snapshot) in
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
            self.user_who_like.append(user_who_likes(name: username, imageurl: imageuser))
                print("123")
                print(self.key_who_like_posts)
                self.TV.reloadData()
            
                })
        }}
    

}
extension get_User_likesVC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user_who_like.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "get_User_likes_Cell") as! get_User_likes_Cell
        cell.personal_name.text = user_who_like[indexPath.row].name
        cell.personal_image.sd_setImage(with: URL(string: user_who_like[indexPath.row].imageurl!), completed: nil)
        return cell
    }
    
    
}
