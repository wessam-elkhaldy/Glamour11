//
//  LoginVC.swift
//  Glamour1
//
//  Created by mac book on 12/5/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase
import FacebookCore
import FacebookLogin
import GoogleSignIn
import FlagPhoneNumber


class LoginVC: UIViewController , GIDSignInDelegate {
    @IBOutlet weak var phoneNumberTextField: FPNTextField!

    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil{
            print(error.localizedDescription)
        }
        else{
            print("okk")
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        customFBNButton()
        hideKeyboardWhenTappedAround()
        
    }
    
    @IBAction func login_Facebook(sender : UIButton){
        if sender.tag == 0{
            login_facebook()
        }
    }
    
    func login_facebook(){
        let loginmanager = LoginManager()
        loginmanager.logIn(permissions: [.publicProfile , .email], viewController: nil) { (result) in
            switch result {
            case .success(granted: _, declined: _, token: _) :
                self.SigninIntoFacebook()
            case .failed(let erro) : print(erro)
            case .cancelled : print("canceled")
            
            }
        }
    }
    
    fileprivate func SigninIntoFacebook(){
        guard let AccesTokenString = AccessToken.current?.tokenString else {
            return
        }
        print(AccesTokenString)
                  let credential = FacebookAuthProvider.credential(withAccessToken: AccesTokenString )
        
        Auth.auth().signIn(with: credential) { (authResult, error) in
                if  error != nil {
                    print(error!.localizedDescription)
                  return
                }
                else{
                    let uid =    Auth.auth().currentUser?.uid
                    let photourl =  Auth.auth().currentUser?.photoURL
                    let dic = authResult?.additionalUserInfo?.profile as! [String:Any]
                    let name = dic["name"] as! String
                    let email = dic["email"] as! String
                    let Data = dic["picture"] as! [String:Any]
                    let data = Data["data"] as! [String : Any]
                    let UrlImge = data["url"] as! String
                                                            
                    FirebaseRealTime.AddUserToDatabaseFacebook(email: email, username: name, UrlImge: UrlImge , uid: uid!) {
                        print("add user is done to firebasedatabase")
                    }
                    let dicc = ["email" : email,"username" : name , "UrlImge" : UrlImge , "uid" : uid]
                    let user : User = User(dice : dicc as! [String : String])
                    UserDefaultHelper.saveUser(user: user)
                    
                    
                    print(UserDefaultHelper.loadUser()?.email)
                    print(UserDefaultHelper.loadUser()?.username)
                    print("the process is doneeeeeee")
                    let nextVC  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "FirstVC")
                //  navigationController?.pushViewController(nextVC, animated: true)
                    self.present(nextVC, animated: true, completion: nil)
//                   let email =  Auth.auth().currentUser?.email
//                   let name =   Auth.auth().currentUser?.displayName
//                   let uid =    Auth.auth().currentUser?.uid
//                   let photourl =  Auth.auth().currentUser?.photoURL
                    //let email =  Auth.auth().currentUser?.email
                    //let name =   Auth.auth().currentUser?.displayName
//                    print(Auth.auth().currentUser?.email)


            }
        
        }

}

    func google_signin(){
            let Goglebutton = GIDSignInButton()
        Goglebutton.frame = CGRect(x: 50, y: 100, width: 30, height: 30)
        view.addSubview(Goglebutton)
        GIDSignIn.sharedInstance()?.delegate = self
        
        
    }
    
    
    @IBAction func login_twitter(sender : UIButton){
          if sender.tag == 2{
              showAlert(title: "Sorry!", message: "You can only log in now with Facebook or e-mail")
          }
      }
    
    
    
    
    
    //You can only log in now with Facebook and e-mail
    
}
extension LoginVC : FPNTextFieldDelegate {

    public func fpnDisplayCountryList() {}

    public func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
        textField.rightViewMode = .always
//        textField.rightView = UIImageView(image: isValid ? #imageLiteral(resourceName: "NZ") : #imageLiteral(resourceName: "PW"))

        print(
            isValid,
            textField.getFormattedPhoneNumber(format: .E164) ?? "E164: nil",
            textField.getFormattedPhoneNumber(format: .International) ?? "International: nil",
            textField.getFormattedPhoneNumber(format: .National) ?? "National: nil",
            textField.getFormattedPhoneNumber(format: .RFC3966) ?? "RFC3966: nil",
            textField.getRawPhoneNumber() ?? "Raw: nil"
        )
    }

    public func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        print(name, dialCode, code)
    }
    
    
}
