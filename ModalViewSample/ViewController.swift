//
//  ViewController.swift
//  ModalViewSample
//
//  Created by 张楚昭 on 16/5/27.
//  Copyright © 2016年 tianxing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //注册通知接收者
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.registerCompletion(_:)), name: "RegisterCompletionNotification", object: nil)
        //监听系统通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.handEnterBackground(_:)), name: UIApplicationDidEnterBackgroundNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.handEnterForeground(_:)), name: UIApplicationWillEnterForegroundNotification, object: nil)
    }
    /**
     回调方法
     */
    func registerCompletion(notification: NSNotification){
        let theData: NSDictionary = notification.userInfo!
        let username = theData.objectForKey("username")
        self.txtUsername.text = username as? String
    }
    func handEnterBackground(notification: NSNotification){
        NSLog("进入到后台")
    }
    func handEnterForeground(notification: NSNotification){
        NSLog("回到前台")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}


