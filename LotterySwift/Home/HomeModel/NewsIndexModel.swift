//
//  NewsIndexModel.swift
//  LotterySwift
//
//  Created by richard on 2018/4/20.
//  Copyright © 2018年 richard. All rights reserved.
//

import UIKit
import HandyJSON

struct NewsIndexModel: HandyJSON {
    
    var id = 0
    var title = ""
    var createTime = ""
//    var sourceUserId = ""
    var showType = 0
    var readCount = 0
    var hasRead = false
    var imgUrl = ""//[NewsImageUrlModel]()
    var ishot = false
    var isTop = false
    
    var isjump = false //是否可以跳转分析师
    var source = ""//来源
    var sourceUserId = "" //分析师userid
    var imageUrl = ""

   
}

struct NewsImageUrlModel: HandyJSON {
    var imageUrl = ""
}
