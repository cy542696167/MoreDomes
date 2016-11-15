//
//  ViewController.swift
//  facebooklogin
//
//  Created by 车玉 on 16/7/26.
//  Copyright © 2016年 车玉. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    let loginButton: FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.readPermissions = ["email"]
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.center = CGPointMake(100, 400)
        view.addSubview(loginButton)
       loginButton.delegate = self
       
        if let token = FBSDKAccessToken.currentAccessToken() {
            fetchprofile()
        }
        
    }
    let parameters = ["fields": "email, first_name, last_name, picture.type(large),gender"]
    
    func fetchprofile() {
        print("fetch profile")
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).startWithCompletionHandler { (connection, result, error) -> Void in
            if error != nil {
               print(error)
                return
            }
            //personal information
            print(result)
            if let email = result["email"] as? String{
                
                print(email)
            }
            if let picture = result["picture"] as? NSDictionary, data = picture["data"] as? NSDictionary, url = data["url"] as? String{
                //head picture
                print(url)
            }
        }
        
        
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
      fetchprofile()
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        
    }
    
    func loginButtonWillLogin(loginButton: FBSDKLoginButton!) -> Bool {
       
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

