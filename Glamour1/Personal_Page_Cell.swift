//
//  Personal_Page_Cell.swift
//  test_ui_glamour
//
//  Created by mac book on 12/3/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import UIKit



class Personal_Page_Cell: UITableViewCell {

    var Delgate : add_like_or_Comment?
    var random_String : String?
    @IBOutlet weak var Like_photo: UIImageView!
    @IBOutlet weak var Posts_details: UILabel!
    @IBOutlet weak var Post_Time: UILabel!
    @IBOutlet weak var Personal_Name: UILabel!
    @IBOutlet weak var Personal_photo: UIImageView!
    @IBOutlet weak var number_of_likes: UILabel!
    @IBOutlet weak var number_of_comments: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func add_comment(sender : UIButton){
        Delgate?.add_comment(random_String: random_String!)
       }
    
    @IBAction func get_Likes(sender : UIButton){
        Delgate?.get_User_who_likes(random_String: random_String!)
        }
    @IBAction func add_like(sender : UIButton){
        Delgate?.add_like(random_String: random_String!, sender: sender)
    }
    
    

}
