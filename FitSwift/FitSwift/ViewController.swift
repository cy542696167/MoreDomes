//
//  ViewController.swift
//  FitSwift
//
//  Created by 车玉 on 16/7/26.
//  Copyright © 2016年 车玉. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let cview = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    cview.frame = CGRectMake(100, 300, 240, 128)
        cview.backgroundColor = UIColor.greenColor()
        view.addSubview(cview)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

