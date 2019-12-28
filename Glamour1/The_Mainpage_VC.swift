//
//  The_Mainpage_VC.swift
//  Glamour1
//
//  Created by mac book on 12/3/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class The_Mainpage_VC: UIViewController {

    @IBOutlet weak var TV: UITableView!
    var comment : String = ""
    var posts : [Posts] = []
    var key : [String] = []
    let refreshControl = UIRefreshControl()

    @IBAction func AddPos(){
        let add_posts = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier:"NewPostsVC")
        navigationController?.pushViewController(add_posts, animated: true)
    }
    func RefreshData(){
        refreshControl.addTarget(self, action: #selector(refreshData), for: UIControl.Event.valueChanged)
            TV.refreshControl = refreshControl
            refreshControl.attributedTitle = NSAttributedString(string: "pull to refresh")
            refreshControl.tintColor = UIColor.red
    }
    
    @objc func refreshData(){
        Observe_Post_data()
      }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TV.dataSource = self
        TV.delegate = self
        Observe_Post_data()
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.4431372549, green: 0.662745098, blue: 0.3529411765, alpha: 1)
        RefreshData()

        

    }
    
    func Observe_Post_data(){
        let ref = Database.database().reference().child("Posts")
        ref.observe(.value) { (DataSnapshot) in
            self.posts.removeAll()

            for  child in DataSnapshot.children {
                let ChildSnapshot = child as? DataSnapshot
                let dic = ChildSnapshot?.value as? [String:Any]
                let author = dic!["author"] as? [String:Any]
                let username = author!["username"] as? String
                let email = author!["email"] as? String
                let urlimge = author!["UrlImge"] as? String
                let uidd = author!["uid"] as? String
                let text = dic!["texts"] as? String
                let number_of_Likes = dic!["number_of_Likes"] as? String
                let number_of_comments = dic!["number_of_comments"] as? String
                let random_String = dic!["random_String"] as? String
                let timestamp = dic!["timestamp"] as? Double
                    let user_profile = User(dice: author as! [String : String])
                let post = Posts(uid: ChildSnapshot!.key, author: user_profile, text: text! , timestamp: timestamp!, random_String: random_String!, number_of_Likes: number_of_Likes, number_of_comments: number_of_comments)

                    self.posts.append(post)
                    print(post.text)
                print(ChildSnapshot!.key)

                self.TV.reloadData()
                self.TV.refreshControl!.endRefreshing()

            }
            print(self.posts.count)
            print(self.posts.count)

        }
    }
    }


extension The_Mainpage_VC : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "The_Mainpage_Cell") as! The_Mainpage_Cell
        
        let post = posts[indexPath.row]
        cell.Personal_photo.sd_setImage(with: URL(string:post.author!.UrlImge), completed: nil)
        cell.Like_photo.image = #imageLiteral(resourceName: "like")
        cell.Personal_Name.text = post.author?.username
        cell.Posts_details.text = post.text
        cell.Delgate = self
        cell.random_String = post.random_String
        let date = post.timestamp?.dateFromMilliseconds(format: "yyyy-MM-dd'T'HH:mm:ss'Z'")
        var dateString = date?.timeAgoSinceDate()
        cell.Post_Time.text = dateString
        cell.number_of_like.text = post.number_of_Likes
        let comment = post.number_of_comments!+" comments"
        cell.number_of_comments.text = comment

//        print(dateString)
        return cell
        
    }
    
    
}
extension The_Mainpage_VC : add_like_or_Comment {
    func get_User_who_likes(random_String: String) {
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let VC = storyboard.instantiateViewController(identifier: "get_User_likesVC") as! get_User_likesVC
               VC.random_String = random_String
               present(VC, animated: true, completion: nil)
    }
    

    
    func add_like(random_String: String , sender : UIButton) {
        fire_base.add_like(random_String: random_String, sender: sender)
        }
    
    
    func add_comment(random_String: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyboard.instantiateViewController(identifier: "Add_Comment_VC") as! Add_Comment_VC
        VC.random_String = random_String
        present(VC, animated: true, completion: nil)
//        Search_for_comment(random_String: random_String)


    }

}
