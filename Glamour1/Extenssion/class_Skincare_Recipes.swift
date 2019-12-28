//
//  class_Skincare_Recipes.swift
//  Glamour1
//
//  Created by mac book on 12/8/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import Foundation
class Skincare_Recipes {
    var Skincare_recipe_name :String = ""
    var Skincare_recipe_details :String = ""
    var urlimage :String = ""
    var Ingredients : String = ""
    var Equipment : String = ""
    var Method : String = ""
    var uid : String = ""

    
    init(dic :[String:Any]) {
        
        Skincare_recipe_name = dic["Skincare_recipe_name"] as! String
        Skincare_recipe_details = dic["Skincare_recipe_details"] as! String
        urlimage = dic["urlimage"] as! String
        Ingredients = dic["Ingredients"] as! String
        Equipment = dic["Equipment"] as! String
        Method = dic["Method"] as! String
        uid = dic["key"] as! String

        
        
    }
}

