//
//  ProductVC_collection.swift
//  Glamour1
//
//  Created by mac book on 11/26/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import UIKit
import SDWebImage
import Firebase
import Alamofire
class ProductVC_collection: UIViewController {
    
//    var productt : [product] = []
    var productss : [Productss] = []

    var product_type : String?{
        didSet{
            products()
        }
    }
   
    
    @IBOutlet weak var CV : UICollectionView!
    var withee : CGFloat = 50
    var collectionViewFlowLayout : UICollectionViewFlowLayout!
    override func viewDidLoad() {
        super.viewDidLoad()
      withee = ( view.frame.size.width - 45 ) / 2
        CV.dataSource = self
        CV.delegate = self
//        getBrandData()
        
    }
    @IBAction func back_to_productList(_ sender: Any) {
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
                                     self.CV.reloadData()
                                 case .failure(let error):
                                     print(error.localizedDescription)
                                     break
                                 }
                             }
        
    }
    
    
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        SetupCollectionViewItemSize()
    }
    
    func SetupCollectionViewItemSize(){
        if collectionViewFlowLayout == nil{
            let numberofitemperrow : CGFloat = 5
            let linespacing : CGFloat = 3
            let interitemSpacing : CGFloat = 3
            let widthe = (view.frame.size.width - 45) / 2
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            collectionViewFlowLayout.itemSize = CGSize(width: widthe, height: widthe+50)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 15, right: 15)
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = 10
            collectionViewFlowLayout.minimumInteritemSpacing = 0
            
            
            CV.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
    

    
    
}



extension ProductVC_collection : UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productss.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProuductCVC_cell", for: indexPath) as! ProuductCVC_cell
        cell.photo.sd_setImage(with: URL(string: productss[indexPath.row].imageLink!), completed: nil)
        cell.product_name.text = productss[indexPath.row].name
        cell.product_details.text = productss[indexPath.row].productssDescription
        return cell
    }
    
    
    
}

//func getBrandData(){
//    Database.database().reference().child("Products").observeSingleEvent(of: .value) { (dataSnapshot) in
//
//        self.productt.removeAll()
//
//        for result in dataSnapshot.children{
//            let snapShot = result as! DataSnapshot
//            var dic  = snapShot.value as! [String : Any]
//            dic["key"] = snapShot.key
//
//
//            let prodoucte = product(dic: dic as! [String : String])
//            print(dic)
//            self.productt.append(prodoucte)
//        }
//
//        self.CV.reloadData()
//    }
//}
