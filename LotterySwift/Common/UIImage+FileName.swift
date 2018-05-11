//
//  UIImage+FileName.swift
//  LotterySwift
//
//  Created by richard on 2018/5/10.
//  Copyright © 2018年 richard. All rights reserved.
//

import UIKit
extension UIImage{
    
    static func lotteryIcon(lotteryId: Int) -> UIImage {
        let helper = AppHelper.shared
        let lotteryImageStr = helper.lotteryNetIconDictionay.object(forKey: String(format: "%d", lotteryId)) as! String
        if lotteryImageStr.count > 0 {
            let imageData = NSData(contentsOf: URL(string: lotteryImageStr)!)
            if (imageData?.length)! > 0 {
                return UIImage(data: imageData! as Data)!
            }else{
                return UIImage(named: "jiang_default_icon")!
            }
        }
        
        var iconName = helper.lotteryIconDictionary.object(forKey: String(format: "%d", lotteryId)) as! String
        if iconName.count <= 0 {
            iconName = "jiang_default_icon"
        }
        guard iconName.count > 0 else {
            return UIImage(named: iconName)!
        }
        return UIImage(named: iconName)!
    }
}
