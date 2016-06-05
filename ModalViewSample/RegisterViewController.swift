//
//  RegisterViewController.swift
//  ModalViewSample
//
//  Created by 张楚昭 on 16/5/28.
//  Copyright © 2016年 tianxing. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    
    @IBAction func sava(sender: AnyObject) {
        self.dismissViewControllerAnimated(true){ () -> Void in
            NSLog("点击Save按钮，关闭模态视图")
            //视图间参数传递
            let dataDict = NSDictionary(object: self.txtUsername.text!, forKey: "username")
            /**
             Notification
             - parameter name: 通知的名字
             - parameter object: 投送通知时传递过来的对象
             - parameter userInfo: 投送通知时定义的字典对象，可借助该参数传递数据
             */
            NSNotificationCenter.defaultCenter().postNotificationName("RegisterCompletionNotification", object: nil, userInfo: dataDict as [NSObject : AnyObject])
        }
    }

    @IBAction func cancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {
            NSLog("点击Cancel按钮，关闭模态视图")
        })
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
