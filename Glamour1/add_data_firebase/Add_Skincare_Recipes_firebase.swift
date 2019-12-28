//
//  Add_Skincare_Recipes_firebase.swift
//  Glamour1
//
//  Created by mac book on 12/7/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage



class Add_Skincare_Recipes_firebase: UIViewController {
    var image :UIImage?
    @IBOutlet weak var Skincare_Recipe : UITextField!
    @IBOutlet weak var Skincare_Recipes_details : UITextField!
    @IBOutlet weak var Ingredients : UITextField!
    @IBOutlet weak var Equipment : UITextField!
    @IBOutlet weak var Method : UITextField!
    @IBOutlet weak var name_of_skincare: UITextField!
    @IBOutlet weak var name_of_image_in_Storage: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func Add_Skiner_recipe(_ sender :Any){
            uploadImage(image: image!)
        }
    
        @IBAction func openGallary(_ sender:Any ){
            let pickerVC = UIImagePickerController()
            pickerVC.sourceType = .photoLibrary
            
            pickerVC.delegate = self
            
            present(pickerVC, animated: true, completion: nil )

    }

        func Add_Skiner_Recipe(url :String){
        
                        let dic :[String:Any] = ["Skincare_recipe_name" : Skincare_Recipe.text, "Skincare_recipe_details" : Skincare_Recipes_details.text , "urlimage" :url , "Ingredients" : Ingredients.text! , "Equipment" : Equipment.text! , "Method" : Method.text! ]

                      Database.database().reference().child("Skiner_Recipe").childByAutoId().setValue(dic)
              //        getBrandData()
                  }
                func uploadImage(image :UIImage){
                    //Storge Firebase
                    let data = image.jpegData(compressionQuality: 0.3)
                   
                    let metaData = StorageMetadata()
                    metaData.contentType = "image/jpeg"
                   
                    let ref  = Storage.storage().reference().child("Images").child("Skincare_Recipe").child(Skincare_Recipe.text!)
                    ref.putData(data!, metadata: metaData) {
                        (metadata, error) in
                        
                        if error != nil {
                            print(error?.localizedDescription)
                            return
                        }else{
            //                print("upload sucessfule")
                            ref.downloadURL { (url, error) in
                                self.Add_Skiner_Recipe(url:  url!.absoluteString)
                            
    }}}}
    
    func getBrandData(){
        Database.database().reference().child("Skiner_Recipe").observeSingleEvent(of: .value) { (dataSnapshot) in
            
            
            for result in dataSnapshot.children{
                let snapShot = result as! DataSnapshot
                var dic  = snapShot.value as! [String : Any]

                dic["key"] = snapShot.key
                
            
                let prodoucte = product(dic: dic as! [String : String])
                print(dic)
//                self.productt.append(prodoucte)
            }
            
//            self.CV.reloadData()
        }
    }
    
    
    func Add_images_Skiner_Recipe(url :String){
        Database.database().reference().child("Skiner_Recipe").observeSingleEvent(of: .value) { (dataSnapshot) in
            
//            self.skincare_recipes.removeAll()
            for result in dataSnapshot.children{
                let snapShot = result as! DataSnapshot
                var dic  = snapShot.value as! [String : Any]
                if dic["Skincare_recipe_name"] as! String == self.name_of_skincare.text{
                    let snapkey = snapShot.key
                    let dicc =  [self.name_of_image_in_Storage.text!:url ]
                    Database.database().reference().child("Skiner_Recipe").child(snapkey).child("images_Skincare").childByAutoId().setValue(url)
                    
                }
                dic["key"] = snapShot.key
                let skincare_recipe = Skincare_Recipes(dic: dic)
                print(dic)
            }
            
        }
        
              }
    
                func uploadImage_Skincare_Recipe(image :UIImage){
                    //Storge Firebase
                    let data = image.jpegData(compressionQuality: 0.3)
                   
                    let metaData = StorageMetadata()
                    metaData.contentType = "image/jpeg"
                   
                    let ref  = Storage.storage().reference().child("Images").child("Skincare_Recipe").child(name_of_skincare.text!).child(name_of_image_in_Storage.text!)
                    ref.putData(data!, metadata: metaData) {
                        (metadata, error) in
                        
                        if error != nil {
                            print(error?.localizedDescription)
                            return
                        }else{
            //                print("upload sucessfule")
                            ref.downloadURL { (url, error) in
                                self.Add_images_Skiner_Recipe(url:  url!.absoluteString)
                            
    }}}}
    
    @IBAction func Add_Skiner_recipe_Images(_ sender :Any){
            uploadImage_Skincare_Recipe(image: image!)
        }
    
    
    
        
}

extension Add_Skincare_Recipes_firebase : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                picker.dismiss(animated: true, completion: nil)

    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        picker.dismiss(animated: true, completion: nil)

        guard let image  = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else{
            return
        }
        
        self.image = image
//        uploadImage(image: image)
        
    }
    
}

