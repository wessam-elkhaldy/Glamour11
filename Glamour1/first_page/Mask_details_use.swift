//
//  Mask_details_use.swift
//  Glamour1
//
//  Created by mac book on 11/29/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import UIKit
import ImageSlideshow
import Foundation

class Mask_details_use: UIViewController {
    @IBOutlet weak var imageslide : ImageSlideshow!
    @IBOutlet weak var cv : UICollectionView!
    @IBOutlet weak var labell : UILabel!
    var collectionViewFlowLayout : UICollectionViewFlowLayout!

    override func viewDidLoad() {
        super.viewDidLoad()
        cv.dataSource = self
        ImageSlideShowe()
        SetupCollectionViewItemSize()
        labell.text = "my name is wessam/niam 20 years old/ iam adffkgmklMGLdafkjagsljkalgjklajgklajhklfsjklashjiorjheaoirg"
        
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
           let localSource = [BundleImageSource(imageString: "Group 2883"), BundleImageSource(imageString: "images"), BundleImageSource(imageString: "Group 2883"), BundleImageSource(imageString: "images")]
           imageslide.slideshowInterval = 2.0
           imageslide.pageIndicatorPosition = .init(horizontal: .center, vertical: .customBottom(padding: 10))
           
           let pageControl = UIPageControl()
           pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.8941176471, green: 0.06666666667, blue: 0.4156862745, alpha: 1)
           pageControl.pageIndicatorTintColor = UIColor.lightGray
           imageslide.pageIndicator = pageControl
           imageslide.setImageInputs(localSource)
       }
    func SetupCollectionViewItemSize(){
        if collectionViewFlowLayout == nil{
            let numberofitemperrow : CGFloat = 5
            let linespacing : CGFloat = 3
            let interitemSpacing : CGFloat = 3
            let widthe = (view.frame.size.width - 30) / 2
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            collectionViewFlowLayout.itemSize = CGSize(width: widthe, height: 254)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 15, right: 15)
            collectionViewFlowLayout.scrollDirection = .horizontal
            collectionViewFlowLayout.minimumLineSpacing = 10
            collectionViewFlowLayout.minimumInteritemSpacing = 0
            
            
            cv.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
    

    
}
extension Mask_details_use : UICollectionViewDataSource,UICollectionViewDelegate{
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
