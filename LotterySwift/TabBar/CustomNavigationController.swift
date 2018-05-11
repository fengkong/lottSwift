//
//  CustomNavigationController.swift
//  LotterySwift
//
//  Created by richard on 2018/4/23.
//  Copyright © 2018年 richard. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController,UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.titleTextAttributes = [kCTForegroundColorAttributeName:UIColor.white,kCTFontAttributeName:UIFont.systemFont(ofSize: 19)] as [NSAttributedStringKey : Any]
//        UIApplication.shared.setStatusBarStyle(<#T##statusBarStyle: UIStatusBarStyle##UIStatusBarStyle#>, animated: <#T##Bool#>)
        interactivePopGestureRecognizer?.isEnabled = true
        navigationBar.barTintColor = GlobalRedColor
        navigationBar.tintColor = UIColor.white
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    override init(rootViewController: UIViewController) {
//        super.init(rootViewController: rootViewController)
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
//    func initWithRootViewController(rootViewController: UIViewController) -> CustomNavigationController! {
//        
////        let nav =
////        return super.initwith
//    }


}
