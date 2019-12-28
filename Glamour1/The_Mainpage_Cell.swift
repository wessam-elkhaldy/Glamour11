//
//  The_Mainpage_Cell.swift
//  Glamour1
//
//  Created by mac book on 12/3/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import UIKit

protocol add_like_or_Comment{
    func add_like(random_String : String , sender : UIButton)
    func add_comment( random_String : String)
    func get_User_who_likes(random_String : String)
}

protocol add_comment {
        func add_comment( random_String : String)
}

class The_Mainpage_Cell: UITableViewCell {
    @IBOutlet weak var Like_photo: UIImageView!
    @IBOutlet weak var Posts_details: UILabel!
    @IBOutlet weak var Post_Time: UILabel!
    @IBOutlet weak var Personal_Name: UILabel!
    @IBOutlet weak var Personal_photo: UIImageView!
    @IBOutlet weak var number_of_like: UILabel!
    @IBOutlet weak var number_of_comments: UILabel!

    var random_String : String!
    var Delgate : add_like_or_Comment?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func add_like(sender : UIButton){
        Delgate?.add_like(random_String: random_String, sender: sender)
    }
    
    @IBAction func add_comment(sender : UIButton){
        Delgate?.add_comment(random_String: random_String)
    }
    @IBAction func get_Likes(sender : UIButton){
        Delgate?.get_User_who_likes(random_String: random_String)
      }

}
