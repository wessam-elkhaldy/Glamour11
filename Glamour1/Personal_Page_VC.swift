//
//  Personal_Page_VC.swift
//  test_ui_glamour
//
//  Created by mac book on 12/3/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import UIKit
import SDWebImage
import Firebase

class Personal_Page_VC: UIViewController {
    var name : String = ""
    var email : String = ""
    var imageProfile : String = ""
    var posts : [Posts]=[]
    var personal_postKey : [String] = []
    let refreshControl = UIRefreshControl()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func RefreshData(){
        refreshControl.addTarget(self, action: #selector(refreshData), for: UIControl.Event.valueChanged)
            TV.refreshControl = refreshControl
            refreshControl.attributedTitle = NSAttributedString(string: "pull to refresh")
            refreshControl.tintColor = UIColor.red
    }
    
    @objc func refreshData(){
        get_personal_post()
      }

    @IBOutlet weak var TV: UITableView!
    @IBOutlet weak var Skine_Type_lbl: UILabel!
    @IBOutlet weak var Personal_name: UILabel!
    @IBOutlet weak var Personal_photo: UIImageView!
    @IBOutlet weak var Cover_Photo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        TV.dataSource = self
        TV.delegate = self
        print(UserDefaultHelper.isLogin())
        LoadUserData()
        Cover_Photo.image = #imageLiteral(resourceName: "BG")
        Skine_Type_lbl.text = "skine type"
        get_key_personal_post()
        RefreshData()

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


            
        }


extension Personal_Page_VC {
            
            
    func get_key_personal_post(){
        guard let user_profile = UserServices.CurrentUser else {
      return
        }
        Database.database().reference().child("Users").child(user_profile.uid).child("Users_posts").observeSingleEvent(of: .value) { (dataSnapshot) in
//                        self.personal_postKey.removeAll()
            for result in dataSnapshot.children{
                let snapShot = result as! DataSnapshot
                var dic  = snapShot.value as! [String : Any]
                let postkey = dic["posts_key"] as! String
                self.personal_postKey.append(postkey)
                dic["key"] = snapShot.key
//                print(dic)
            }
            
            print(self.personal_postKey)
            self.get_personal_post()
            
        }
    }
    
        func get_personal_post(){
         guard let user_profile = UserServices.CurrentUser else {
        return
            }

            for perso_key in personal_postKey {
                print(personal_postKey.count)
                Database.database().reference().child("Posts").child(perso_key).observe(DataEventType.value, with: { (snapshot) in
                  let postDict = snapshot.value as? [String : AnyObject] ?? [:]
//                    print(postDict)
                let author = postDict["author"] as! [String:Any]
                let text = postDict["texts"] as! String
                let timestamp = postDict["timestamp"] as! Double
                let number_of_Likes = postDict["number_of_Likes"] as! String
                let number_of_comments = postDict["number_of_comments"] as! String
                let random_String = postDict["random_String"] as? String
                let user = User(dice: author as! [String : String])
                let post = Posts(uid: user_profile.uid, author:user , text: text, timestamp: timestamp, random_String: (random_String)!, number_of_Likes: number_of_Likes, number_of_comments: number_of_comments)
                self.posts.append(post)
                self.TV.reloadData()

                }
                )
            }

            
            }
    
        }
    
            extension Personal_Page_VC : UITableViewDataSource , UITableViewDelegate{
                func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                    return posts.count
                }
                func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "Personal_Page_Cell") as! Personal_Page_Cell
                    let post = posts[indexPath.row]
                    cell.Personal_photo.sd_setImage(with: URL(string: post.author!.UrlImge), completed: nil)
                    cell.Like_photo.image = #imageLiteral(resourceName: "like")
                    cell.Personal_Name.text = post.author?.username
                    cell.Posts_details.text = post.text
                    let date = post.timestamp?.dateFromMilliseconds(format: "yyyy-MM-dd'T'HH:mm:ss'Z'")
                    var dateString = date?.timeAgoSinceDate()
                    cell.Post_Time.text = dateString
                    cell.number_of_likes.text = post.number_of_Likes
                    let comment = post.number_of_comments!+" comments"
                    cell.number_of_comments.text = comment
                    cell.Delgate = self
                    cell.random_String = post.random_String
                    
                    return cell
                }
            }
        
extension Personal_Page_VC : add_like_or_Comment{
    func add_like(random_String: String, sender: UIButton) {
        fire_base.add_like(random_String: random_String, sender: sender)
        
            }
    
    func add_comment(random_String: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyboard.instantiateViewController(identifier: "Add_Comment_VC") as! Add_Comment_VC
        VC.random_String = random_String
        present(VC, animated: true, completion: nil)
        
            }
    
    func get_User_who_likes(random_String: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
              let VC = storyboard.instantiateViewController(identifier: "get_User_likesVC") as! get_User_likesVC
              VC.random_String = random_String
              present(VC, animated: true, completion: nil)
    }
    
    
}
            

                   
   
    
    
    
  


