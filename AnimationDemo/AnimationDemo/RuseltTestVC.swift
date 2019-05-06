//
//  RuseltTestVC.swift
//  AnimationDemo
//
//  Created by YSY_iMac on 2019/5/5.
//  Copyright © 2019 YSY_iMac. All rights reserved.
//

import UIKit

class RuseltTestVC: UIViewController {
  var image1 = UIImageView()
  var rightRtn: UIBarButtonItem! {
    return UIBarButtonItem(title: "成功", style: .plain, target: self, action: #selector(successClick))
  }
  let showView = RuseltView(frame: CGRect(x: 0, y: 0, width: 200, height: 140), text: "哈哈哈哈哈哈哈哈啊哈哈哈哈哈哈哈")

    override func viewDidLoad() {
        super.viewDidLoad()
      image1.frame = CGRect(x: UIScreen.main.bounds.size.width / 2 - 100, y: UIScreen.main.bounds.size.height / 2 - 70, width: 200, height: 140)
      self.view.addSubview(image1)
     
      self.view.backgroundColor = UIColor.white
      
    }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
     self.navigationItem.rightBarButtonItem = rightRtn
  }
  
  @objc func successClick() {
    if showView.superview != nil {
      showView.removeFromSuperview()
    }
    image1.addSubview(showView)
   showView.markview.showAnimation()
  }
  
}
