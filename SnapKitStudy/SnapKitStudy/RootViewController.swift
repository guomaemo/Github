//
//  RootViewController.swift
//  SnapKitStudy
//
//  Created by macbook on 16/9/25.
//  Copyright © 2016年 郭志凯. All rights reserved.
//

import UIKit
import SnapKit

class RootViewController: UIViewController
{
    var logImage:UIImageView?
    var uersLable:UILabel?
    var uersText:UITextField?
    var passwordLabel:UILabel?
    var passText:UITextField?
    var loginButton:UIButton?
    var promptSignLabel:UILabel?
    var registerButton:UIButton?
    var forgetpass:UIButton?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //logImage设置
        self.logImage = UIImageView(frame: CGRectZero)
        let image = UIImage(named: "1")
        self.logImage = UIImageView(image: image)
        //加载到父视图
        self.view.addSubview(logImage!)
        //圆角设置
        self.logImage?.layer.cornerRadius = 8
        self.logImage?.layer.masksToBounds = true
        //自动布局
        self.logImage?.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(80)
            make.top.equalTo(50)
            make.right.equalTo(-80)
            make.height.equalTo(self.view.bounds.height/3.0)
        })
        
        //uersLable设置
        self.uersLable = UILabel(frame: CGRectZero)
        self.uersLable?.text = "用户名"
        //颜色、字体设置
        self.uersLable?.textColor = UIColor.grayColor()
        self.uersLable?.font = UIFont.boldSystemFontOfSize(13)
        //加载到父视图
        self.view.addSubview(uersLable!)
        //自动布局
        self.uersLable?.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(20)
            make.top.equalTo(self.logImage!.snp_bottom).offset(40)
        })
        
        //uersText设置
        self.uersText = UITextField(frame: CGRectZero)
        self.uersText?.text = "请输入帐号"
        //输入框样式、开始编辑清空内容
        self.uersText?.borderStyle = UITextBorderStyle.RoundedRect
        self.uersText?.clearsOnBeginEditing = true
        //颜色、字体设置
        self.uersText?.textColor = UIColor.grayColor()
        self.uersText?.font = UIFont.boldSystemFontOfSize(13)
        //加载到父视图
        self.view.addSubview(uersText!)
        //自动布局
        self.uersText?.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(self.uersLable!.snp_bottom).offset(10)
        })
        
        //passwordLabel设置
        self.passwordLabel = UILabel(frame: CGRectZero)
        self.passwordLabel?.text = "密码"
        //颜色、字体设置
        self.passwordLabel?.textColor = UIColor.grayColor()
        self.passwordLabel?.font = UIFont.boldSystemFontOfSize(13)
        //加载到父视图
        self.view.addSubview(passwordLabel!)
        //自动布局
        self.passwordLabel?.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(20)
            make.top.equalTo(self.uersText!.snp_bottom).offset(20)
        })
        
        //passText设置
        self.passText = UITextField(frame: CGRectZero)
        self.passText?.text = "请输入密码"
        //密码格式
        self.passText?.secureTextEntry = true
        //输入框样式、开始编辑清空内容
        self.passText?.borderStyle = UITextBorderStyle.RoundedRect
        self.passText?.clearsOnBeginEditing = true
        //颜色、字体设置
        self.passText?.textColor = UIColor.grayColor()
        self.passText?.font = UIFont.boldSystemFontOfSize(12)
        //加载到父视图
        self.view.addSubview(passText!)
        //自动布局
        self.passText?.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(self.passwordLabel!.snp_bottom).offset(10)
        })
        
        //loginButton设置
        self.loginButton = UIButton(frame: CGRectZero)
        self.loginButton?.backgroundColor = UIColor.yellowColor()
        self.loginButton?.setTitle("登入", forState: .Normal)
        self.loginButton?.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.loginButton?.setTitleColor(UIColor.yellowColor(), forState: .Highlighted)
        //加载到父视图
        self.view.addSubview(loginButton!)
        //自动布局
        self.loginButton?.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(self.passText!.snp_bottom).offset(20)
        })
        
        //promptSignLabel设置
        self.promptSignLabel = UILabel(frame: CGRectZero)
        self.promptSignLabel?.text = "还没有注册?"
        //颜色、字体设置
        self.promptSignLabel?.textColor = UIColor.grayColor()
        self.promptSignLabel?.font = UIFont.boldSystemFontOfSize(12)
        //加载到父视图
        self.view.addSubview(promptSignLabel!)
        //自动布局
        self.promptSignLabel?.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(self.view.bounds.width/3)
            make.bottom.equalTo(-36)
        })
        
        //registerButton设置
        self.registerButton = UIButton (frame: CGRectZero)
        self.registerButton?.setTitle("SIGN UP", forState: .Normal)
        //颜色、字体设置
        self.registerButton?.titleLabel?.font = UIFont.boldSystemFontOfSize(12)
        self.registerButton?.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.registerButton?.setTitleColor(UIColor.yellowColor(), forState: .Highlighted)
        //加载到父视图
        self.view.addSubview(registerButton!)
        //自动布局
        self.registerButton?.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(self.promptSignLabel!.snp_right).offset(5)
            make.bottom.equalTo(-30)
        })
        
        //forget设置
        self.forgetpass = UIButton(frame: CGRectZero)
        self.forgetpass?.setTitle("忘记密码?", forState: .Normal)
        //颜色、字体设置
        self.forgetpass?.titleLabel?.font = UIFont.boldSystemFontOfSize(12)
        self.forgetpass?.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.forgetpass?.setTitleColor(UIColor.yellowColor(), forState: .Highlighted)
        //加载到父视图
        self.view.addSubview(forgetpass!)
        //自动布局
        self.forgetpass?.snp_makeConstraints(closure: { (make) in
            make.right.equalTo(self.passText!.snp_right)
            make.top.equalTo(self.passText!.snp_top)
        })
    }
}
