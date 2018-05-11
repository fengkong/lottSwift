//
//  UIViewController+NavigationItem.swift
//  LotterySwift
//
//  Created by 孔峰 on 2018/4/28.
//  Copyright © 2018年 孔峰. All rights reserved.
//

import Foundation

extension UIViewController{
    
    func configNavigationBackItem() {
        let leftButton = UIButton(type: .custom)
        leftButton.backgroundColor = .clear
        leftButton.isExclusiveTouch = true
        leftButton.frame = CGRect(x: 0.0, y: 0.0, width: 45, height: 22.0)
        leftButton.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        leftButton.setImage(UIImage(named: "navbar_back"), for: UIControlState.normal)
        leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        leftButton.addTarget(self, action: #selector(backItemAction(_:)), for: UIControlEvents.touchUpInside)
        let leftItem = UIBarButtonItem(customView: leftButton)
        leftItem.style = UIBarButtonItemStyle.plain
        self.navigationItem.leftBarButtonItem = leftItem
        self.leftButtonAction = leftButton
        
        
    }
    
    @objc func backItemAction(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    private struct Associatedkeys {
        static var managerKey = "leftActionButton"
    }
    
    var leftButtonAction: UIButton? {
        get {
            return objc_getAssociatedObject(self, &Associatedkeys.managerKey) as? UIButton
        }
        
        set (manager){
            objc_setAssociatedObject(self, &Associatedkeys.managerKey, manager, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
}
