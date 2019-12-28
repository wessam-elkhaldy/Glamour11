//
//  MasksVC.swift
//  Glamour1
//
//  Created by mac book on 12/26/19.
//  Copyright © 2019 mac book. All rights reserved.
//





import UIKit
import Firebase
import SDWebImage

class MasksVC: UIViewController {

    @IBOutlet weak var tv : UITableView!
    var masks : [Masks] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tv.dataSource = self
        tv.delegate = self
        get_Masks()
//        wes()
        
    }
    @IBAction func back_to_firstVC(_ sender: Any) {
          navigationController?.popViewController(animated: true)
         }
    
    @IBAction func view_as_collection(_ sender: Any) {
        let storboard = UIStoryboard(name: "Main", bundle: nil)
        let list_collection = storboard.instantiateViewController(identifier: "ProductVC_collection") as! ProductVC_collection
        navigationController?.pushViewController(list_collection, animated: true)
    }
    
    
    func get_Masks(){
        Database.database().reference().child("Masks").observeSingleEvent(of: .value) { (dataSnapshot) in
            
            self.masks.removeAll()
            for result in dataSnapshot.children{
                let snapShot = result as! DataSnapshot
                var dic  = snapShot.value as! [String : Any]
                dic["key"] = snapShot.key
                let keyy = Database.database().reference().child("Masks").childByAutoId().key
                
            
                let mask = Masks(dic: dic)
                
                print(dic)
                self.masks.append(mask)
            }
            
            self.tv.reloadData()
        }
    }

}

extension MasksVC : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return masks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"Masks_Cell") as! Masks_Cell
//        let product_index = Products[indexPath.row]
        let mask_index = masks[indexPath.row]
        cell.Masks_name.text = mask_index.Masks_name
        cell.Masks_details.text = mask_index.Masks_details
        cell.photo.sd_setImage(with: URL(string: mask_index.urlimage), completed: nil)
        
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storboard = UIStoryboard(name: "Main", bundle: nil)
        let Mask_detailsvc = storboard.instantiateViewController(identifier: "Masks_DetailsVC") as! Masks_DetailsVC
        let mask_index = masks[indexPath.row]
        Mask_detailsvc.uid = mask_index.uid
        print("2314234")
        navigationController?.pushViewController(Mask_detailsvc, animated: true)

    }
}

extension MasksVC : Add_to_Fav {
    func add_fav(uid: String , sender : UIButton) {
        if sender.isSelected{
            sender.isSelected = false
            Search_for_Data(product_name: uid , status : false)

        }else{
            sender.isSelected = true
            Search_for_Data(product_name: uid , status : true)
        }
//        print(uid)
        
    }

    
    func Search_for_Data(product_name : String , status : Bool){
        Database.database().reference().child("Skiner_Recipe").queryOrdered(byChild: "Skincare_recipe_name").queryEqual(toValue: product_name).observeSingleEvent(of: .value, with: { (snapshot) in
                 let currentUser = Auth.auth().currentUser?.uid
                   if !snapshot.exists() {
                       print("No data found")
                       return
                   }
            let dic = snapshot.value as! [String:Any]
            var x = dic.keys
          print(dic.keys)
            print(snapshot.key.description)
                   var productt = snapshot.value as! [String:AnyObject]
            self.add_to_fav(key: "-LvknvWZFleD7ynyiAQK" , status : status)
            print("mohammedwa\(productt.keys)")
            
            
            

                    })
    }
    
    func add_to_fav(key : String , status : Bool){
//        guard let user_profile = UserServices.CurrentUser else {
//            print("eeeerrrrorrroror")
//            return
//            }
        let dic = [Auth.auth().currentUser?.uid : true]
        guard let uid =  Auth.auth().currentUser!.uid as? String else {
            return
        }
        Database.database().reference().child("Skiner_Recipe").child(key).child("Favorite").child(uid).setValue(status) { (Error, DatabaseReference) in
            if Error != nil {
                print(Error?.localizedDescription)
                
            }
            else{
                print("successs")
            }
        }
        Database.database().reference().child("Users").child(uid).child("Skincare_Fav").child(key).setValue(status) { (Error, DatabaseReference) in
            if Error != nil {
                print(Error?.localizedDescription)
            }else{
                print("add user to favorute is success")
            }
        }
        
    }
}
