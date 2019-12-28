//
//  uiViewController.swift
//  Glamour1
//
//  Created by mac book on 12/28/19.
//  Copyright © 2019 mac book. All rights reserved.
//
import Foundation
import UIKit
extension UIViewController {
    
    
    
    func showAlert(title :String , message :String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: { (action) in
            print("button cancel pressed")
        }))
        
         
        
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { (action) in
            print("button cancel pressed")
        }))
        
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func openSignInVC(){
        let vc  = self.storyboard!.instantiateViewController(withIdentifier: "LoginVC")
        
        self.present(vc, animated: true){
            print("from closures")
        }
    }
    
            func hideKeyboardWhenTappedAround() {
let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(UIViewController.dismissKeyboard))
          tap.cancelsTouchesInView = false
          view.addGestureRecognizer(tap)
        }
    
       @objc func dismissKeyboard() {
           view.endEditing(true)
        }
    
}
 
