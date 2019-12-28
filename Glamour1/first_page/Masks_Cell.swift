//
//  Masks_Cell.swift
//  Glamour1
//
//  Created by mac book on 12/26/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import UIKit

class Masks_Cell: UITableViewCell {

    @IBOutlet weak var vieww : UIView!
     @IBOutlet weak var Masks_details: UILabel!
     @IBOutlet weak var Masks_name: UILabel!
     @IBOutlet weak var photo: UIImageView!
     var Delgate : Add_to_Fav!
     var name : String!
     
     override func awakeFromNib() {
         super.awakeFromNib()
     }

     override func setSelected(_ selected: Bool, animated: Bool) {
         super.setSelected(selected, animated: animated)
     }

     @IBAction func fav_button(sender : UIButton){
         Delgate.add_fav(uid: name! , sender : sender)
     }
}
