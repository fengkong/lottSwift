//
//  CustomTabBarController.swift
//  LotterySwift
//
//  Created by richard on 2018/4/23.
//  Copyright © 2018年 richard. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    var middleImageView: UIImageView?
    var tipImageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight)
        initControllers()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension CustomTabBarController {
    private func initControllers(){
        
        let homeIndexController = HomeIndexViewController()
        let hall = CustomNavigationController.init(rootViewController: homeIndexController)
        
        let openController = OpenViewController()
        let open = CustomNavigationController(rootViewController: openController)
        
        let disController = DiscoverViewController()
        let discover = CustomNavigationController(rootViewController: disController)
        
        let userController = UserViewController()
        let user = CustomNavigationController(rootViewController: userController)
        
        let controllerArray: [CustomNavigationController] = [hall, open, discover, user]
        
        viewControllers = controllerArray
  
        
        
        tabBar.tintColor = .red

        let normalImageArray: [String] = ["jdd_buy_main_buy01","jdd_buy_main_open","jdd_buy_main_regist01","jdd_buy_main_user01"]
        let selectImageArray: [String] = ["jdd_buy_main_buy01_press","jdd_buy_main_open_press","jdd_buy_main_regist01_press","jdd_buy_main_user01_press"]
            
        let titles: [String] = ["首页", "开奖", "发现", "我的"]
        
        for i in 0...(tabBar.items!.count - 1) {
            let iten: UITabBarItem = tabBar.items![i]
            iten.title = titles[i]
            iten.tag = i
            let normalImage = UIImage(named: normalImageArray[i])
            let selectedImage = UIImage(named: selectImageArray[i])
            iten.image = normalImage
            iten.selectedImage = selectedImage
            
            
        }
        selectedIndex = 0
        
    }
    
    
    func currentYopViewController() -> UIViewController {
        return viewControllers![selectedIndex]
    }
    
    
    
}
