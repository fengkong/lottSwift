//
//  UIView+Additions.swift
//  LotterySwift
//
//  Created by 孔峰 on 2018/5/7.
//  Copyright © 2018年 孔峰. All rights reserved.
//

import UIKit

extension UIView {
   static func animationView(aView: UIView, delay: CGFloat){
        UIView.animate(withDuration: 0.1, delay: TimeInterval(delay), options: UIViewAnimationOptions.curveEaseOut, animations: {
            aView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }) { (finished) in
            UIView.animate(withDuration: 0.1, animations: {
                
                aView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0 )
                let button = aView as! UIButton
                button.isSelected = true
                
            }, completion: { (finished) in
                
            })
        }
    }
}
