//
//  PageVC.swift
//  Glamour1
//
//  Created by mac book on 11/30/19.
//  Copyright © 2019 mac book. All rights reserved.
//

import UIKit

class PageVC: UIPageViewController {


      lazy var orderviewcontroller : [UIViewController] = {
          return [self.NewVC(viewcontroller: "boarding1"),self.NewVC(viewcontroller: "boarding2"),self.NewVC(viewcontroller: "boarding3")]
          
      }()
      override func viewDidLoad() {
          super.viewDidLoad()
          print("hellore")
          self.dataSource = self
          
         if let firstViewController = orderviewcontroller.first {
          setViewControllers([firstViewController] , direction: .forward , animated: true, completion: nil)
            }

              }
      

      func NewVC(viewcontroller : String) -> UIViewController{
          return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: viewcontroller)
      }
      
  
}



extension PageVC : UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewcontrollerindex = orderviewcontroller.index(of : viewController) else {return nil}
        let previousIndex = viewcontrollerindex - 1
        guard previousIndex >= 0 else {
            return nil

//           return orderviewcontroller.last
        }
        guard orderviewcontroller.count > previousIndex else{
            return nil
        }
        
            return orderviewcontroller[previousIndex]
        
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
           guard let viewcontrollerindex = orderviewcontroller.index(of : viewController) else {return nil}
             let nextindex = viewcontrollerindex + 1
        guard orderviewcontroller.count != nextindex  else {
            return nil

//            return orderviewcontroller.first
            
             }
             guard orderviewcontroller.count > nextindex else{
                 return nil
             }
             
                 return orderviewcontroller[nextindex]
             
    }
    
}
