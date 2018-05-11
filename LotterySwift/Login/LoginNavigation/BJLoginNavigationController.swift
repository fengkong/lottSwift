//
//  BJLoginNavigationController.swift
//  LotterySwift
//
//  Created by richard on 2018/5/11.
//  Copyright © 2018年 richard. All rights reserved.
//

import UIKit

class BJLoginNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor(hexString: "333333") ?? UIColor.gray, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 19)]
        interactivePopGestureRecognizer?.isEnabled = true
        navigationBar.barTintColor = UIColor.white
        navigationBar.tintColor = UIColor(hexString: "333333")
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
    }

}
