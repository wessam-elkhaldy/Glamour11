//
//  todelete.swift
//  Glamour1
//
//  Created by mac book on 11/29/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import UIKit
import ImageSlideshow
import Firebase
class details: UIViewController {
    
    @IBOutlet weak var imageslide : ImageSlideshow!
    @IBOutlet weak var cv : UICollectionView!
    var collectionViewFlowLayout : UICollectionViewFlowLayout!
    var skiner_recipe : Skincare_Recipes?
    var images_Skincare : [String] = []
    var uid : String? {
        didSet {
            print("okkkkkkk")
        }
    }
    @IBOutlet weak var Ingredients : UILabel!
    @IBOutlet weak var Equipment : UILabel!
    @IBOutlet weak var Method : UILabel!
    var ingredients : String?
    var equipment : String?
    var method : String?
    var details : Details?


    override func viewDidLoad() {
        super.viewDidLoad()
        Ingredients.text = ""
        Equipment.text = ""
        Method.text = ""
        getSkincar_Details_Data()
        SetupCollectionViewItemSize()
        cv.dataSource = self
        print("wessammmmm\(uid)")

    }
    
    @IBAction func back(_sender : UIButton){
        navigationController?.popViewController(animated: true)
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func ImageSlideShowe(){
        var imageSource  :[SDWebImageSource] = []
        print(images_Skincare.count)
        for image in images_Skincare {
            imageSource.append(SDWebImageSource(urlString: image as! String)!)
        }
        
        let localSource = [BundleImageSource(imageString: "Group 2883"), BundleImageSource(imageString: "images"), BundleImageSource(imageString: "Group 2883"), BundleImageSource(imageString: "images")]
        imageslide.slideshowInterval = 2.0
        imageslide.contentMode = .scaleToFill
        
        imageslide.pageIndicatorPosition = .init(horizontal: .center, vertical: .customBottom(padding: 20))
        
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.8941176471, green: 0.06666666667, blue: 0.4156862745, alpha: 1)
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        imageslide.pageIndicator = pageControl
        imageslide.setImageInputs(imageSource)
    }
    
    @IBAction func ShowDetails(sender : UIButton){
        if (sender.tag == 0){
            if Ingredients.text == "" {
                Ingredients.text = details?.Ingredients
            }else{
                Ingredients.text = ""
            }
    }
        if (sender.tag == 1){
               if Equipment.text == "" {
                Equipment.text = details?.Equipment
               }else {
                   Equipment.text = ""
               }
           }
        if (sender.tag == 2){
                 if Method.text == "" {
                    Method.text = details?.Method
                 }else {
                     Method.text = ""
                 }
             }
        }
    
    
    func SetupCollectionViewItemSize(){
        if collectionViewFlowLayout == nil{
            let numberofitemperrow : CGFloat = 5
            let linespacing : CGFloat = 3
            let interitemSpacing : CGFloat = 3
            let widthe = (view.frame.size.width - 30) / 2
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            collectionViewFlowLayout.itemSize = CGSize(width: widthe, height: 245)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 15, right: 15)
            collectionViewFlowLayout.scrollDirection = .horizontal
            collectionViewFlowLayout.minimumLineSpacing = 10
            collectionViewFlowLayout.minimumInteritemSpacing = 0
            
            cv.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
    func getSkincar_Details_Data(){
        guard let Uid = uid else {
            return
        }
        var s = String()
        
        Database.database().reference().child("Skiner_Recipe").child(uid!).observeSingleEvent(of: .value) { (dataSnapshot) in
            let snapshot = dataSnapshot as! DataSnapshot
            print(snapshot.childrenCount)
            print(snapshot.value)
            let dic = snapshot.value as! [String:Any]
            print(dic["Equipment"])
            self.details = Details(dic: dic)
            let images = dic["images_Skincare"] as! [String:Any]
            print(images.keys)
            print(images.values)
            var z : Int = 0
            for img in images{
//                s.append(img.key)
                self.images_Skincare.append(images[img.key] as! String)
            }
            print(self.images_Skincare)
            self.ImageSlideShowe()

        }

        
    }
}

extension details : UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "details_cvc_cell", for: indexPath) as! details_cvc_cell
        cell.photo.image = #imageLiteral(resourceName: "s1")
        cell.product_name.text = "Sensodain"
        cell.product_details.text = "Lorem ipsum dolor sitamet, consetetur,sadipscing elitr, sediam nonumy,Lorem ipsum dolor sitamet, consetetur,sadipscing"
        return cell
    }
}
