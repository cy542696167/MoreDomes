//
//  MarkView.swift
//  AnimationDemo
//
//  Created by YSY_iMac on 2019/5/6.
//  Copyright © 2019 YSY_iMac. All rights reserved.
//

import UIKit

class MarkView: UIView {
  var markColor: UIColor = UIColor.orange //图标颜色
  var markWidth: CGFloat = 3.0 //图标线条宽度
  var durationTime: CGFloat = 0.6 //动画时间
  private let markLayer = CAShapeLayer()
  private let circlelayer = CAShapeLayer()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    drawMarkLayer()
    drawCircleLayer()
  }
  
  func showAnimation() {
    if markLayer.superlayer != nil {
      markLayer.removeFromSuperlayer()
    }
    if circlelayer.superlayer != nil {
      circlelayer.removeFromSuperlayer()
    }
    drawMarkLayer()
    drawCircleLayer()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func drawMarkLayer() {
    markLayer.path = drawMarkPath()
    markLayer.fillColor = UIColor.clear.cgColor
    markLayer.frame = self.bounds
    markLayer.lineWidth = markWidth
    markLayer.strokeColor = markColor.cgColor
    markLayer.add(addMarkAnimation(), forKey: "addMarkAnimation")
    self.layer.addSublayer(markLayer)
  }
  
  func drawCircleLayer() {
    let path = UIBezierPath(arcCenter: CGPoint(x: self.bounds.size.width / 2, y: self.bounds.size.height / 2), radius: self.bounds.size.width / 2, startAngle: -.pi, endAngle: .pi, clockwise: true)
    circlelayer.path = path.cgPath
    circlelayer.fillColor = UIColor.clear.cgColor
    circlelayer.frame = self.bounds
    circlelayer.lineWidth = markWidth
    circlelayer.strokeColor = markColor.cgColor
    circlelayer.add(addMarkAnimation(), forKey: "addCircleAnimation")
    self.layer.addSublayer(circlelayer)
  }
  
  func drawMarkPath() -> CGPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: self.bounds.width * 0.27, y: self.bounds.height * 0.54))
    path.addLine(to: CGPoint(x: self.bounds.width * 0.41, y: self.bounds.height * 0.69))
    path.addLine(to: CGPoint(x: self.bounds.width * 0.75, y: self.bounds.height * 0.35))
    path.lineCapStyle = .square
    return path.cgPath
  }
  
  func addMarkAnimation() -> CABasicAnimation {
    let animation = CABasicAnimation(keyPath: "strokeEnd")
    animation.duration = CFTimeInterval(durationTime)
    animation.fromValue = 0
    animation.toValue = 1
    return animation
  }

}
