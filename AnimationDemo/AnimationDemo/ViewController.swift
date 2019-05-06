//
//  ViewController.swift
//  AnimationDemo
//
//  Created by YSY_iMac on 2019/5/5.
//  Copyright © 2019 YSY_iMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var tableview: UITableView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }


}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 45
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = "\(indexPath.row)"
    return cell
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("点击了：", indexPath.row)
    let vc = RuseltTestVC()
    self.navigationController?.pushViewController(vc, animated: true)
  }
}
