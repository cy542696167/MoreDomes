//
//  ShakeAnimationVC.swift
//  AnimationDemo
//
//  Created by YSY_iMac on 2019/5/28.
//  Copyright © 2019 YSY_iMac. All rights reserved.
//

import UIKit

class ShakeAnimationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  

}

extension UIView {
  func startShakeAnimation() {
    let myAnimation: CAKeyframeAnimation = CAKeyframeAnimation() //创建动画
    myAnimation.isRemovedOnCompletion = false //设置这个属性为false,当应用退到后台再进来的时候保证动画还存在
    let left: CGFloat = CGFloat(-Double.pi / 2) * 0.1 //这个值控制动画的抖动范围(振幅)
    let right: CGFloat = CGFloat(Double.pi / 2) * 0.1
    myAnimation.keyPath = "position" //设置动画的样式
    myAnimation.keyPath = "transform.rotation"
    myAnimation.values = [(left), (right), (left)]
    myAnimation.duration = 0.15 //执行一次动画的时间
    myAnimation.repeatCount = MAXFLOAT //执行无限次
    myAnimation.fillMode = .forwards
    self.layer.add(myAnimation, forKey: "shakeAnimation")
  }
}
