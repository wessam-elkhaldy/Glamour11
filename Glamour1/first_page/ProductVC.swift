

import UIKit
import Firebase
import SDWebImage
import Alamofire

class ProductVC: UIViewController {

    @IBOutlet weak var tv : UITableView!
//    var Products : [product] = []
    var productss : [Productss] = []
    var product_type : String?{
        didSet{
            print("product_type2 = \(product_type)")
            products()

        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tv.dataSource = self
        tv.delegate = self
//        self.hidesBottomBarWhenPushed = true

    }
    
    @IBAction func view_as_collection(_ sender: Any) {
        let storboard = UIStoryboard(name: "Main", bundle: nil)
        let list_collection = storboard.instantiateViewController(identifier: "ProductVC_collection") as! ProductVC_collection
        list_collection.product_type = product_type
        navigationController?.pushViewController(list_collection, animated: true)
    }
    @IBAction func back_to_products(_ sender: Any) {
        navigationController?.popViewController(animated: true)
       }
       
    
    
    
    func products(){
        var param = [String:String]()
               param["product_type"] = product_type
               AF.request("http://makeup-api.herokuapp.com/api/v1/products.json?",method:.get , parameters: param  ).responseJSON { response in
                                 debugPrint(response)
                                 switch response.result {
                                 case .success(let data):
                                     let dic = data as! [Any]
                                      let result = data as! [Any]
                                      let newsData = try? JSONSerialization.data(withJSONObject: result, options: [])
                                     self.productss =  try! JSONDecoder().decode([Productss].self, from: newsData!)
                                     print(self.productss[0].brand)
                                     self.tv.reloadData()
                                 case .failure(let error):
                                     print(error.localizedDescription)
                                     break
                                 }
                             }
        
    }
    
    

    
}

extension ProductVC : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productss.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"ProudctCell") as! ProudctCell
//        let product_index = Products[indexPath.row]
        cell.photo.sd_setImage(with: URL(string: productss[indexPath.row].imageLink!), completed: nil)
        cell.product_name.text = productss[indexPath.row].name
        cell.product_details.text = productss[indexPath.row].productssDescription
        
        
        return cell
    }
    
    
}

//
//func getProductsData(){
//    Database.database().reference().child("Products").observeSingleEvent(of: .value) { (dataSnapshot) in
//
//        self.Products.removeAll()
//
//        for result in dataSnapshot.children{
//            let snapShot = result as! DataSnapshot
//            var dic  = snapShot.value as! [String : Any]
//            dic["key"] = snapShot.key
//            let prodouct = product(dic: dic as! [String : String])
//            print(dic)
//            self.Products.append(prodouct)
//        }
//
//        self.tv.reloadData()
//    }
//}
