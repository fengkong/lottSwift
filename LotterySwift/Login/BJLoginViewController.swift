//
//  BJLoginViewController.swift
//  LotterySwift
//
//  Created by richard on 2018/5/11.
//  Copyright © 2018年 richard. All rights reserved.
//

import UIKit

class BJLoginViewController: UIViewController {

    @IBOutlet weak var acountTextFiled: UITextField!
    @IBOutlet weak var passwordTextFiled: UITextField!
    @IBOutlet weak var passwordIcon: UIImageView!
    @IBOutlet weak var accountIcon: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBlackCloseItem()
        configNavigationRegisterItem()
        
        title = "登录"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //action
    @IBAction func loginAction(_ sender: UIButton) {
    }
    
    @IBAction func smsLoginAction(_ sender: UIButton) {
        navigationController?.pushViewController(BJSmsLoginRViewController(), animated: true)
    }
    
    @IBAction func passwordAction(_ sender: UIButton) {
        navigationController?.pushViewController(BJPasswordViewController(), animated: true)
    }
    @IBAction func wechartLoginAction(_ sender: UIButton) {
       
    }
}


extension BJLoginViewController {
    
    private func configNavigationRegisterItem(){
        let rightCloseItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.plain, target: self, action: #selector(registerItemAction))
        rightCloseItem.tintColor = GlobalRedColor
        navigationItem.rightBarButtonItem = rightCloseItem
    }
    
    @objc private func registerItemAction(){
         navigationController?.pushViewController(BJRegisterViewController(), animated: true)
    }
}
