//
//  RuseltView.swift
//  AnimationDemo
//
//  Created by YSY_iMac on 2019/5/5.
//  Copyright © 2019 YSY_iMac. All rights reserved.
//

import UIKit

class RuseltView: UIView {
  let markview = MarkView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
  var titleLab: UILabel!
  
  init(frame: CGRect, text: String) {
    super.init(frame: frame)
    markview.center = CGPoint(x: self.center.x, y: 25)
    self.addSubview(markview)
    markview.showAnimation()
    titleLab = UILabel()
    titleLab.text = text
    titleLab.numberOfLines = 0
    titleLab.textAlignment = .center
    titleLab.font = UIFont(name: "PingFangSC-Medium", size: 17)
    let size = titleLab.sizeThatFits(CGSize(width: 180, height: CGFloat(MAXFLOAT)))
    titleLab.frame = CGRect(origin: CGPoint(x: 5, y: 50), size: size)
    titleLab.textColor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1.00)
    self.addSubview(titleLab)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
  
}
