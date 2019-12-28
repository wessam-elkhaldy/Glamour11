//
//  Details.swift
//  Glamour1
//
//  Created by mac book on 12/13/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import Foundation

class Details{
    var Equipment : String?
    var Ingredients : String?
    var Method : String?
    var Skincare_recipe_details : String?
    var Skincare_recipe_name : String?
    var image1 : String?
    var image2 : String?
    var image3 : String?
    var image4 : String?
    var image5 : String?

    init(dic : [String:Any]) {
        Equipment = dic["Equipment"] as! String
        Ingredients = dic["Ingredients"] as! String
        Method = dic["Method"] as! String
        Skincare_recipe_details = dic["Skincare_recipe_details"] as! String
        Skincare_recipe_name = dic["Skincare_recipe_name"] as! String
        let images = dic["images_Skincare"] as? [String:Any]
        image1 = images?["1"] as? String
        image1 = images?["2"] as? String
        image1 = images?["3"] as? String
        image1 = images?["4"] as? String
        image1 = images?["5"] as? String

    }
    
}
