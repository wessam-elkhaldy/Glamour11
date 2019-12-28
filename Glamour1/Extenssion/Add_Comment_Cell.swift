//
//  Add_Comment_Cell.swift
//  Glamour1
//
//  Created by mac book on 12/16/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import UIKit

class Add_Comment_Cell: UITableViewCell {

    @IBOutlet weak var name : UILabel!
    @IBOutlet weak var comment_text : UILabel!
    @IBOutlet weak var personal_imge : UIImageView!
    @IBOutlet weak var time_label : UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
