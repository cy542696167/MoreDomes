//
//  ViewController.swift
//  CutPicture
//
//  Created by 车玉 on 16/8/2.
//  Copyright © 2016年 cy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var textImg = UIImageView()
    var imageH: CGFloat! = 0
    var imageW: CGFloat! = 0
    var Scaling: CGFloat! = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    let image = UIImage(named: "01.jpg")
        if image?.size.width > view.frame.size.width  / 2 && image != nil{
           imageW = view.frame.size.width  / 2
         Scaling = (image?.size.width)! / imageW
           imageH = (image?.size.height)! / Scaling
            if imageH > 100 {
                 let imagea =  image?.crop(CGRectMake(0, 0, 1000, 600))
                textImg.frame = CGRectMake(0, 0, imageW, imageH)
                textImg.image = imagea
               view.addSubview(textImg)
                
            }
            
        }
        
        
       
        
    
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension UIImage{
    /**
     图片裁剪
     
     - parameter bounds: 你需要的尺寸
     
     - returns:裁剪后的图片
     */
    func crop(bounds: CGRect) -> UIImage?
    {
        return UIImage(CGImage: CGImageCreateWithImageInRect(self.CGImage, bounds)!,
                       scale: 0.0, orientation: self.imageOrientation)
    }
    
        
    
}