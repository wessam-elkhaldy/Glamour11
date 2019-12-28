//
//  login_vc.swift
//  Glamour1
//
//  Created by mac book on 12/9/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
class login_vc: UIViewController {

    @IBOutlet weak var username : UITextField!
    @IBOutlet weak var emailtf : UITextField!
    @IBOutlet weak var passwordtf : UITextField!
    @IBOutlet weak var confirmpasswordtf : UITextField!
    @IBOutlet weak var imageview : UIImageView!

    var image :UIImage?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func Add_User(_ sender :Any){
        uploadImage(image: image!)
        }
    
        @IBAction func openGallary(_ sender:Any ){
            let pickerVC = UIImagePickerController()
            pickerVC.sourceType = .photoLibrary
            
            pickerVC.delegate = self
            
            present(pickerVC, animated: true, completion: nil )

    }
    
    func signin( Url : String){
        Auth.auth().createUser(withEmail: emailtf.text!, password: passwordtf.text!) { (result, error) in
          let uid =  Auth.auth().currentUser?.uid
            if error == nil{
                FirebaseRealTime.AddUserToDatabaseFacebook(email: self.emailtf.text!, username: self.username.text!, UrlImge: Url,  uid: uid!) {
                }
                    
                let dicc = ["email" : self.emailtf.text! ,"username" : self.username.text , "UrlImge" : Url , "uid" : uid] as [String : Any]
                let user : User = User(dice : dicc as! [String : String])
                UserDefaultHelper.saveUser(user: user)
            }
        }
        
    }
    
                func uploadImage(image :UIImage){
                    //Storge Firebase
                    let data = image.jpegData(compressionQuality: 0.3)
                   
                    let metaData = StorageMetadata()
                    metaData.contentType = "image/jpeg"
                   
                    let ref  = Storage.storage().reference().child("ImagesUser").child("Users").child(username.text!)
                    ref.putData(data!, metadata: metaData) {
                        (metadata, error) in
                        
                        if error != nil {
                            print(error?.localizedDescription)
                            return
                        }else{
            //                print("upload sucessfule")
                            ref.downloadURL { (url, error) in
                                self.signin(Url:  url!.absoluteString)
                            
    }}}}

}

extension login_vc : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                picker.dismiss(animated: true, completion: nil)

    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        picker.dismiss(animated: true, completion: nil)

        guard let image  = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else{
            return
        }
        
        self.image = image
        imageview.image = image
//        uploadImage(image: image)
        
    }
    
}

