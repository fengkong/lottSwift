//
//  HomeHotGameModel.swift
//  LotterySwift
//
//  Created by richard on 2018/4/20.
//  Copyright © 2018年 richard. All rights reserved.
//

import UIKit

class HomeHotGameModel: NSObject {

    var endTime: String!
    var guestImg: String!
    var guestTeam: String!
    var homeImg: String!
    var homeTeam: String!
    var mId: String!
    var matchId: String!
    var matchName: String!
    var spf: String!
    var type: String!
    
    init(dict: [String: Any]){
        super.init()
        endTime = dict["endTime"] as? String ?? ""
        guestImg = dict["guestImg"] as? String ?? ""
        guestTeam = dict["guestTeam"] as? String ?? ""
        homeImg = dict["homeImg"] as? String ?? ""
        homeTeam = dict["homeTeam"] as? String ?? ""
        mId = dict["mId"] as? String ?? ""
        matchId = dict["matchId"] as? String ?? ""
        matchName = dict["matchName"] as? String ?? ""
        spf = dict["spf"] as? String ?? ""
        type = dict["type"] as? String ?? ""
    }
}
