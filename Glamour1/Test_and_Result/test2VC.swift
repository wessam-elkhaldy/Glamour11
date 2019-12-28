//
//  test2VC.swift
//  kjgk
//
//  Created by mac book on 12/1/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import UIKit

class test2VC: UIViewController {

    @IBOutlet weak var lbl_bold: NSLayoutConstraint!
    @IBOutlet weak var omge1cont: NSLayoutConstraint!
    
    @IBOutlet weak var otlet2: NSLayoutConstraint!
    @IBOutlet weak var otlet: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if UIDevice().userInterfaceIdiom == .phone {
        switch UIScreen.main.nativeBounds.height {
            case 1136:
                print("iPhone 5 or 5S or 5C")

            case 1334:
                print("iPhone 6/6S/7/8")
                otlet.constant = 15
                otlet2.constant = 15

            case 1920, 2208:
                print("iPhone 6+/6S+/7+/8+")

            case 2436:
                print("iPhone X/XS/11 Pro")

            case 2688:
                print("iPhone XS Max/11 Pro Max")
                omge1cont.constant = 40
                lbl_bold.constant = 30
            

            case 1792:
                print("iPhone XR/ 11 ")

            default:
                print("Unknown")
            }
        }

    }
    


}
