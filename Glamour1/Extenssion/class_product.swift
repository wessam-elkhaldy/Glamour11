//
//  class_product.swift
//  Glamour1
//
//  Created by mac book on 12/7/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import Foundation

class product {
    var product_name :String = ""
    var product_details :String = ""
    var imageUrl :String = ""
    var product_uid : String = ""
    
    init(dic :[String:Any]) {
        product_details = dic["product_details"] as! String
        product_name = dic["prouduct_name"] as! String
        imageUrl = dic["url"] as! String
        product_uid = dic["key"] as! String
        
    }
}

