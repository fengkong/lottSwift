//
//  KvModel.swift
//  LotterySwift
//
//  Created by 孔峰 on 2018/4/20.
//  Copyright © 2018年 孔峰. All rights reserved.
//

import UIKit

class KvModel: NSObject {

    var imageUrl: String!
    
    var param: String!
    var actionId: Int!
    var category: Int!
    var business: Int!
    var description0: String!
    var path: String!
    var traceID: String!
    
    
    //新首页加的
    var userId: String!
    var userName: String!
    var lotteryID: Int!
    var lotteryName: String!
    var money: String!
    var isWinList: Bool!
    
    //发现新加
    var title: String!//发现
    var name: String!//name
    var funcode: String!
    
    
}

extension KvModel {
    
    func parseBuyHallKVModel(dict: NSDictionary) {
        imageUrl = dict["imageUrl"] as? String ?? ""
        param = (dict["action"] as! NSDictionary)["param"] as! String
        business = Int((dict["action"] as! NSDictionary)["business"] as? String ?? "")
        category = Int((dict["action"] as! NSDictionary)["category"] as? String ?? "")
        actionId = Int((dict["action"] as! NSDictionary)["id"] as? String ?? "")
        description0 = (dict["action"] as! NSDictionary)["description"] as? String ?? ""
        traceID = dict["traceId"] as? String ?? ""
        isWinList = false
    }
    
    func parseWinListModel(dict: NSDictionary) {
        isWinList = true
        description0 = String(format: "恭喜%@用户投注%@中奖%.2f元", dict["userName"] as! String, dict["lotteryName"] as! String, dict["money"] as! CGFloat)
    }
    
    func parseAdsKVModel(dict: NSDictionary) {
        imageUrl = dict["imageUrl"] as? String ?? ""
        param = (dict["action"] as! NSDictionary)["param"] as? String ?? ""
        business = Int((dict["action"] as! NSDictionary)["business"] as? String ?? "")
        category = Int((dict["action"] as! NSDictionary)["category"] as? String ?? "")
        actionId = Int((dict["action"] as! NSDictionary)["id"] as? String ?? "")
        description0 = (dict["action"] as! NSDictionary)["description"] as? String ?? ""
        traceID = dict["traceId"] as? String ?? ""
        name = dict["subjectName"] as? String ?? ""
        isWinList = false
    }
    
    func parseDiscoverKVModel(dict: NSDictionary) {
        actionId = Int((dict["actionid"] as? String ?? ""))
        business = Int(dict["business"] as? String ?? "")
        category = Int(dict["category"] as? String ?? "")
        description0 = dict["description"] as? String ?? ""
        imageUrl = dict["iconurl"] as? String ?? ""
        path = dict["imagePath"] as? String ?? ""
        param = dict["param"] as? String ?? ""
        traceID = dict["traceId"] as? String ?? ""
        title = dict["title"] as? String ?? ""
        name = dict["name"] as? String ?? ""
        funcode = dict["funcode"] as? String ?? ""
    }
}
