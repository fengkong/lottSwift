//
//  UserCenterModel.swift
//  LotterySwift
//
//  Created by 孔峰 on 2018/5/9.
//  Copyright © 2018年 孔峰. All rights reserved.
//

import UIKit

class UserCenterModel: NSObject {
    var imageStr = ""
    var title = ""
    var subTitle = ""
    var hiddenTip = true
    var hBbadgeCount = 0
    
    init(image: String, tit: String, sub: String, isTip: Bool){
        imageStr = image
        title = tit
        subTitle = sub
        hiddenTip = isTip
    }
}
