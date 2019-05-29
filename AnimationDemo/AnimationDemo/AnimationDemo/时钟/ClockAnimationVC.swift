//
//  ClockAnimationVC.swift
//  AnimationDemo
//
//  Created by YSY_iMac on 2019/5/27.
//  Copyright © 2019 YSY_iMac. All rights reserved.
//

import UIKit

class ClockAnimationVC: UIViewController {
  
  var seconView: UIView!
  var minView: UIView!
  var hourView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .white
       let image = UIImageView(frame: CGRect(x: UIScreen.main.bounds.size.width / 2 - 100, y: UIScreen.main.bounds.size.height / 2 - 70, width: 214, height: 214))
      image.center = view.center
//      image.layer.cornerRadius = 107
//      image.layer.masksToBounds = true
      view.addSubview(image)
      addClockAnimation(clockImage: image)
    }
  
  func addClockAnimation(clockImage: UIImageView) {
    let seconView = UIView()
    seconView.layer.bounds = CGRect(x: 0, y: 0, width: 1, height: clockImage.frame.width / 2 - 10)
    seconView.layer.backgroundColor = UIColor.red.cgColor
    seconView.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
    self.seconView = seconView
    clockImage.addSubview(self.seconView)
    
    let minView = UIView()
    minView.layer.bounds = CGRect(x: 0, y: 0, width: 2, height: clockImage.frame.width / 2 - 30)
    minView.layer.backgroundColor = UIColor.black.cgColor
    minView.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
    self.minView = minView
    clockImage.addSubview(self.minView)
    
    let hourView = UIView()
    hourView.layer.bounds = CGRect(x: 0, y: 0, width: 3, height: clockImage.frame.width / 2 - 40)
    hourView.layer.backgroundColor = UIColor.black.cgColor
    hourView.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
    self.hourView = hourView
    clockImage.addSubview(self.hourView)
    
    let link = CADisplayLink(target: self, selector: #selector(timeAction))
    link.add(to: .main, forMode: .common)
  }
  
  @objc func timeAction() {
    let canlender = Calendar.current
    let secs = canlender.component(.second, from: Date())
    let mins = canlender.component(.minute, from: Date())
    let hours = canlender.component(.hour, from: Date())
    let ange1 = .pi * 2 / 60 * CGFloat(secs)
    let ange2 = .pi * 2 / 60 * CGFloat(mins) + ange1 / 60
    let ange3 = .pi * 2 / 12 * CGFloat(hours) + ange2 / 60
    self.seconView.transform = CGAffineTransform(rotationAngle: ange1)
    self.minView.transform = CGAffineTransform(rotationAngle: ange2)
    self.hourView.transform = CGAffineTransform(rotationAngle: ange3)
  }

}
