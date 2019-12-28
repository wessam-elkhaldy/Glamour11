//
//  ViewController.swift
//  Glamour1
//
//  Created by mac book on 11/26/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class ViewController: UIViewController {
    var nameproduct = ["Products","Skincare Recipes","Mask Recipes"]
    @IBOutlet weak var tv : UITableView!
    var image :UIImage?
    var Categories = ["Type_product_VC","Skinecare_recipeVC","MasksVC"]
    var postsKey : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let user = UserDefaultHelper.loadUser() else {
            return
        }
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.4431372549, green: 0.662745098, blue: 0.3529411765, alpha: 1)
        self.title = "Hi," + user.username
        tv.dataSource = self
        tv.delegate = self
        get_number_of_coomnet()
    }
    
    @IBAction func logout(sender : UIButton){
       try! Auth.auth().signOut()
        UserDefaultHelper.DeleteUser()
        
    }

    func get_number_of_coomnet(){
                
        Database.database().reference().child("Posts").observe(DataEventType.value, with: { (snapshot) in
              let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            for posts in postDict {
//                print(posts.key)
                self.postsKey.append(posts.key)
            }
//           print(self.postsKey)
             self.lkdsh()
        }
            
        )
   
            }

    
        func lkdsh(){
            
            for key in postsKey {
                Database.database().reference().child("Posts").child(key).child("User_Comments_Posts").observe(DataEventType.value, with: { (snapshot) in
                      let postDict = snapshot.value as? [String : AnyObject] ?? [:]
//                    print(postDict)
//                    print(postDict.count)

                    Database.database().reference().child("Posts").child(key).child("number_of_comments").setValue(postDict.count.description)
                    
                    })
                
                Database.database().reference().child("Posts").child(key).child("User_Likes_Posts").observe(DataEventType.value, with: { (snapshot) in
                    let postDict = snapshot.value as? [String : AnyObject] ?? [:]
                    var count = 0
                    for postlike in postDict {
                        if postlike.value as! Bool == true {
                            count += 1
                        }
                    }
                Database.database().reference().child("Posts").child(key).child("number_of_Likes").setValue(count.description)
                    
//                    Database.database().reference().child("Posts").child(key).child("number_of_Likes").setValue(postDict.count.description)
                                        
                                        })
                
                
            }
            
            
            
        
    }
    
    
}
    



extension ViewController : UITableViewDataSource  , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! tableCell
        cell.label_product.text = nameproduct[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let NextVC = storyboard.instantiateViewController(identifier: Categories[indexPath.row])
        navigationController?.pushViewController(NextVC, animated: true)
    }
    
}


//let ref = Database.database().reference().child("Posts").child("-LwErAckYHgdszAj2ctM")
//      ref.observe(.value) { (DataSnapshot) in
//  //        self.posts.removeAll()
//          for  child in DataSnapshot.children {
//              let ChildSnapshot = child as? DataSnapshot
//              let dic = ChildSnapshot?.value as? [String:Any]
//              let author = dic!["author"] as? [String:Any]
//              let username = author!["username"] as? String
//              let email = author!["email"] as? String
//              let urlimge = author!["UrlImge"] as? String
//              let uidd = author!["uid"] as? String
//              let text = dic!["texts"] as? String
//              let random_String = dic!["random_String"] as? String
//              let timestamp = dic!["timestamp"] as? Double
//                  let user_profile = User(dice: author as! [String : String])
//              let post = Posts(uid: ChildSnapshot!.key, author: user_profile, text: text! , timestamp: timestamp!, random_String: random_String!)
//                                  print(post.text)
//              print(ChildSnapshot!.key)
//          }
//
//  }
