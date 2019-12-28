//
//  class_Skincare_Recipes.swift
//  Glamour1
//
//  Created by mac book on 12/8/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import Foundation
class Masks {
    var Masks_name :String = ""
    var Masks_details :String = ""
    var urlimage :String = ""
    var Ingredients : String = ""
    var Equipment : String = ""
    var Method : String = ""
    var uid : String?

    
    init(dic :[String:Any]) {
        
        Masks_name = dic["Masks_name"] as! String
        Masks_details = dic["Masks_details"] as! String
        urlimage = dic["urlimage"] as! String
        Ingredients = dic["Ingredients"] as! String
        Equipment = dic["Equipment"] as! String
        Method = dic["Method"] as! String
        uid = dic["key"] as? String

        
        
    }
}

