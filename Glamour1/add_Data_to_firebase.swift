//
//  add_Data_to_firebase.swift
//  Glamour1
//
//  Created by mac book on 12/7/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import Foundation
import Firebase
import UIKit

class Add_data_to_fire_base{
    
        @IBAction func addBrand(_ sender :Any){
            uploadImage(image: image!)
        }
        
        func addBrand(url :String){
            let dic :[String:Any] = ["prouduct_name" : "", "product_details" : "" , "url" :url]

            Database.database().reference().child("Brands").childByAutoId().setValue(dic)
    //        getBrandData()
        }
}


extension Add_data_to_fire_base : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                picker.dismiss(animated: true, completion: nil)

    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        picker.dismiss(animated: true, completion: nil)

        guard let image  = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else{
            return
        }
        
        
        self.image = image
        //uploadImage(image: image)
        
    }
    
    
    
}

