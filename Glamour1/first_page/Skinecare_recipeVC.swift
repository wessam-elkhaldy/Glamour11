

import UIKit
import Firebase
import SDWebImage

class Skinecare_recipeVC: UIViewController {

    @IBOutlet weak var tv : UITableView!
    var skincare_recipes : [Skincare_Recipes] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tv.dataSource = self
        tv.delegate = self
        get_Skinecare_recipe()
//        wes()
        
    }
    
    @IBAction func view_as_collection(_ sender: Any) {
        let storboard = UIStoryboard(name: "Main", bundle: nil)
        let list_collection = storboard.instantiateViewController(identifier: "ProductVC_collection") as! ProductVC_collection
        navigationController?.pushViewController(list_collection, animated: true)
    }
    @IBAction func back_to_firstVC(_ sender: Any) {
          navigationController?.popViewController(animated: true)
         }
    
    func get_Skinecare_recipe(){
        Database.database().reference().child("Skiner_Recipe").observeSingleEvent(of: .value) { (dataSnapshot) in
            
            self.skincare_recipes.removeAll()
            for result in dataSnapshot.children{
                let snapShot = result as! DataSnapshot
                var dic  = snapShot.value as! [String : Any]
                dic["key"] = snapShot.key
                let keyy = Database.database().reference().child("Skiner_Recipe").childByAutoId().key
                
            
                let skincare_recipe = Skincare_Recipes(dic: dic)
                print(dic)
                self.skincare_recipes.append(skincare_recipe)
            }
            
            self.tv.reloadData()
        }
    }
    

}

extension Skinecare_recipeVC : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skincare_recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"Skinecare_recipe_Cell") as! Skinecare_recipe_Cell
//        let product_index = Products[indexPath.row]
        cell.photo.sd_setImage(with: URL(string: skincare_recipes[indexPath.row].urlimage), completed: nil)
        cell.Skinecare_recipe_name.text = skincare_recipes[indexPath.row].Skincare_recipe_name
        cell.Skinecare_recipe_details.text = skincare_recipes[indexPath.row].Skincare_recipe_details
        cell.Delgate = self
        cell.name = skincare_recipes[indexPath.row].Skincare_recipe_name
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storboard = UIStoryboard(name: "Main", bundle: nil)
        let details_vc = storboard.instantiateViewController(identifier: "details") as! details
        details_vc.uid = skincare_recipes[indexPath.row].uid
        print("2314234")
        navigationController?.pushViewController(details_vc, animated: true)
        
    }
}

extension Skinecare_recipeVC : Add_to_Fav {
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
