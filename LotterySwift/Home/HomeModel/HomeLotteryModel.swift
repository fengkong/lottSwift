//
//  HomeLotteryModel.swift
//  LotterySwift
//
//  Created by 孔峰 on 2018/4/20.
//  Copyright © 2018年 孔峰. All rights reserved.
//

import UIKit

class HomeLotteryModel: NSObject {

    var code: String!
    var imageUrl: String!
    var isAddAwards: Int!
    var isSale: String!
    var lotteryId: Int!
    var isSubTitleLight: Bool!
    var isShow: String!
    var lotteryName: String!
    var order: String!
    var superScript: String!
    var subTitle: String!
    var alertContent: String!
    var jumpId: String!
    
    func parseBuyHallLotteryModel(dict: NSDictionary) {
         code = dict["code"] as? String ?? ""
         imageUrl = dict["imageUrl"] as? String ?? ""
         isAddAwards = dict["isAddAwards"] as? Int ?? 0
         isSale =   String(format: "%d", dict["isSale"] as? Int ?? 0)
         lotteryId = dict["lotteryId"] as? Int ?? 0
         isSubTitleLight =  dict["isSubTitleLight"] as? Bool ?? false
         isShow = String(format: "%d", dict["isShow"] as? Int ?? 0)
         lotteryName = dict["lotteryName"] as? String ?? ""
         order = dict["order"] as? String ?? ""
         superScript = dict["superScript"] as? String ?? ""
         subTitle = dict["subTitle"] as? String ?? ""
         alertContent = dict["alertContent"] as? String ?? ""
         jumpId = dict["jumpId"] as? String ?? ""
    }
   
    func isNumberLotteryOrNot() -> Bool {
        
        return true
    }
    
}
