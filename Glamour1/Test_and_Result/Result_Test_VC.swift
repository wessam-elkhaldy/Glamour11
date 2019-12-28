//
//  Result_Test_VC.swift
//  kjgk
//
//  Created by mac book on 12/2/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import UIKit

class Result_Test_VC: UIViewController {

    @IBOutlet weak var CON_lbl2_top: NSLayoutConstraint!
    @IBOutlet weak var CON_lbl1_top: NSLayoutConstraint!
    @IBOutlet weak var CON_result_top: NSLayoutConstraint!
    @IBOutlet weak var CON_imge_top: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        constraint()
    }
    

    func constraint(){
        
                if UIDevice().userInterfaceIdiom == .phone {
               switch UIScreen.main.nativeBounds.height {
                   case 1136:
                       print("iPhone 5 or 5S or 5C")

                   case 1334:
                       print("iPhone 6/6S/7/8")



                   case 1920, 2208:
                       print("iPhone 6+/6S+/7+/8+")

                   case 2436:
                       print("iPhone X/XS/11 Pro")
                
                   case 2688:
                       print("iPhone XS Max/11 Pro Max")
                CON_imge_top.constant = 80
                CON_result_top.constant = 30
                CON_lbl1_top.constant = 60
                CON_lbl2_top.constant = 30
           
                   case 1792:
                       print("iPhone XR/ 11 ")

                   default:
                       print("Unknown")
                   }
               }
    }

}
