//
//  add_data_firebase.swift
//  Glamour1
//
//  Created by mac book on 12/7/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class add_data_firebase: UIViewController {
    var image :UIImage?
    @IBOutlet weak var product_name : UITextField!
    @IBOutlet weak var product_details : UITextField!

    
    
    @IBOutlet weak var imgeview: UIImageView!
    
    func ss(){
        let aString = "This is my string"
        let newString = aString.replacingOccurrences(of: " ", with: "\n", options: .literal, range: nil)
         print(newString)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ss()
     }
    
    @IBAction func Add_product(_ sender :Any){
            uploadImage(image: image!)
        }
    
        @IBAction func openGallary(_ sender:Any ){
            let pickerVC = UIImagePickerController()
            pickerVC.sourceType = .photoLibrary
            
            pickerVC.delegate = self
            
            present(pickerVC, animated: true, completion: nil )

    }
    
    func Add_Product(url :String){
        let dic :[String:Any] = ["prouduct_name" : product_name.text!, "product_details" : product_details.text! , "url" :url]

                  Database.database().reference().child("Products").childByAutoId().setValue(dic)
          //        getBrandData()
              }
            func uploadImage(image :UIImage){
                //Storge Firebase
                let data = image.jpegData(compressionQuality: 0.3)
               
                let metaData = StorageMetadata()
                metaData.contentType = "image/jpeg"
               
                let ref  = Storage.storage().reference().child("Images").child("Products").child(product_name.text!)
                ref.putData(data!, metadata: metaData) {
                    (metadata, error) in
                    
                    if error != nil {
                        print(error?.localizedDescription)
                        return
                    }else{
        //                print("upload sucessfule")
                        ref.downloadURL { (url, error) in
                            self.Add_Product(url:  url!.absoluteString)
                        
}}}}
    
    
    

}

extension add_data_firebase : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                picker.dismiss(animated: true, completion: nil)

    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        picker.dismiss(animated: true, completion: nil)

        guard let image  = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else{
            return
        }
        
        self.image = image
        imgeview.image = image
//        uploadImage(image: image)
        
    }
    
}

