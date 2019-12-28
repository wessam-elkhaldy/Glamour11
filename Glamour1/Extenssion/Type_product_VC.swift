//
//  Type_product_VC.swift
//  Glamour1
//
//  Created by mac book on 12/18/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import UIKit

struct Type_product {
    var image_of_type : UIImage?
    var name_of_type : String?
}


class Type_product_VC: UIViewController {
    var type_product : [Type_product] = []
    @IBOutlet weak var TV : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        TV.dataSource = self
        TV.delegate = self
        append_data()
        self.tabBarController?.tabBar.isHidden = true

    }

    func append_data(){
        type_product.append(Type_product(image_of_type: #imageLiteral(resourceName: "blush"), name_of_type: "blush"))
        type_product.append(Type_product(image_of_type: #imageLiteral(resourceName: "bronzer-1"), name_of_type: "Bronzer"))
        type_product.append(Type_product(image_of_type: #imageLiteral(resourceName: "eyeliner"), name_of_type: "Eyeliner"))
        type_product.append(Type_product(image_of_type: #imageLiteral(resourceName: "eye_shodw-1"), name_of_type: "Eyeshadow"))
        type_product.append(Type_product(image_of_type: #imageLiteral(resourceName: "foundation-1"), name_of_type: "Foundation"))
        type_product.append(Type_product(image_of_type: #imageLiteral(resourceName: "libliner-1"), name_of_type: "Lip liner"))
        type_product.append(Type_product(image_of_type: #imageLiteral(resourceName: "blush"), name_of_type: "Lipstick"))
        type_product.append(Type_product(image_of_type: #imageLiteral(resourceName: "maskara"), name_of_type: "Mascara"))
        type_product.append(Type_product(image_of_type: #imageLiteral(resourceName: "nail_polish"), name_of_type: "Nail polish"))
    }
    
    @IBAction func back_to_firstVC(_ sender: Any) {
          navigationController?.popViewController(animated: true)
         }


}
extension Type_product_VC : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return type_product.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Type_product_Cell") as! Type_product_Cell
        cell.Image_of_type_product.image = type_product[indexPath.row].image_of_type
        cell.name_of_type_product.text = type_product[indexPath.row].name_of_type

        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let VC = storyboard.instantiateViewController(identifier: "ProductVC")  as! ProductVC
        VC.product_type = type_product[indexPath.row].name_of_type as! String
        navigationController?.pushViewController(VC, animated: true)
    }
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let VC = storyboard.instantiateViewController(identifier: "to_show_product")  as! to_show_product
//        VC.product_type = product_type[indexPath.row]
//        present(VC, animated: true, completion: nil)
//
//    }
    
    
}
