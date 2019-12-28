//
//  ProudctCell.swift
//  Glamour1
//
//  Created by mac book on 11/26/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import UIKit

class ProudctCell: UITableViewCell {
    @IBOutlet weak var vieww : UIView!

    @IBOutlet weak var product_details: UILabel!
    @IBOutlet weak var product_name: UILabel!
    @IBOutlet weak var photo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

}
