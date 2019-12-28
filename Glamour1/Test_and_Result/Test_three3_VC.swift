//
//  Test_three3_VC.swift
//  kjgk
//
//  Created by mac book on 12/1/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import UIKit

class Test_three3_VC: UIViewController {

    @IBOutlet weak var CON_imge_top: NSLayoutConstraint!
    @IBOutlet weak var CON_button: NSLayoutConstraint!
    @IBOutlet weak var CON_imge_below: NSLayoutConstraint!
    @IBOutlet weak var CON_Lbl_Four: NSLayoutConstraint!
    @IBOutlet weak var CON_Lbl_Three: NSLayoutConstraint!
    
    @IBOutlet weak var CON_Lbl_Two: NSLayoutConstraint!
    @IBOutlet weak var CON_Lbl_One: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if UIDevice().userInterfaceIdiom == .phone {
        switch UIScreen.main.nativeBounds.height {
            case 1136:
                print("iPhone 5 or 5S or 5C")

            case 1334:
                print("iPhone 6/6S/7/8")
                CON_imge_top.constant = 0
                CON_button.constant = 17


            case 1920, 2208:
                print("iPhone 6+/6S+/7+/8+")

            case 2436:
                print("iPhone X/XS/11 Pro")

            case 2688:
                print("iPhone XS Max/11 Pro Max")
                CON_Lbl_One.constant = 40
                CON_Lbl_Two.constant = 30
                CON_Lbl_Three.constant = 30
                CON_Lbl_Four.constant = 30
                CON_imge_below.constant = 40


 
            

            case 1792:
                print("iPhone XR/ 11 ")

            default:
                print("Unknown")
            }
        }
    }
    


}
