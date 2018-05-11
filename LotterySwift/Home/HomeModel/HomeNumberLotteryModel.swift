//
//  HomeNumberLotteryModel.swift
//  LotterySwift
//
//  Created by richard on 2018/4/20.
//  Copyright © 2018年 richard. All rights reserved.
//

import UIKit

class HomeNumberLotteryModel: NSObject {

    var endTime: String!
    var lotteryCode: String!
    var money: String!
    var show: String!
    var zhshow: Bool!
    var zhurl: String!
    
    init(dict: [String: Any]) {
        super.init()
        endTime = dict["endTime"] as? String ?? ""
        lotteryCode = dict["lotteryCode"] as? String ?? ""
        money = dict["money"] as? String ?? ""
        show = dict["show"] as? String ?? ""
        zhshow = dict["zhshow"] as? Bool ?? false
        zhurl = dict["zhurl"] as? String ?? ""
    }
}
