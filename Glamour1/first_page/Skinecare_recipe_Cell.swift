//
//  ProudctCell.swift
//  Glamour1
//
//  Created by mac book on 11/26/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import UIKit

protocol Add_to_Fav {
    func add_fav(uid : String , sender : UIButton)
}

class Skinecare_recipe_Cell: UITableViewCell {
    @IBOutlet weak var vieww : UIView!
    @IBOutlet weak var Skinecare_recipe_details: UILabel!
    @IBOutlet weak var Skinecare_recipe_name: UILabel!
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
