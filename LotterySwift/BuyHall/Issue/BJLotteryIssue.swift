//
//  BJLotteryIssue.swift
//  LotterySwift
//
//  Created by richard on 2018/5/2.
//  Copyright © 2018年 richard. All rights reserved.
//

import UIKit
import SwiftyJSON

class BJLotteryIssue: NSObject {

    
    var lotteryId: Int!
    var currentClassName: String!
    var hostViewController: UIViewController!
    
    var issueNameStr: String!
    var issueName: String!
    var preIssueName: String!
    var issueId: String!
    var code: String!
    var name: String!
    var endTime: String!
    var currentTime: String!
    var awardTime: String!
    var  balance: String!
    var isPreIssue: Bool!
    var openedCount: Int!
    var remainCount: Int!
    
    var showBlockView: Bool!
    var endTimeStamp: CLongLong!
    
    var alertDesc: String!
    
    
    
    
    func requestIssueData(completeBlock: @escaping((error: String, issueDict: NSDictionary)) -> ())  {
        
        let iussueInfoAction = IussueInfoAction.init(host: hostViewController)
        iussueInfoAction.execute(input: ["" : ""])
        iussueInfoAction.complateHandler = { (isSuccess, data) in
             let arrar: NSArray = JSON(data).arrayObject!  as NSArray
            if !IsEmpty(thing: arrar) {
                let issueDict = arrar[0] as! NSDictionary
                
                if IsEmpty(thing: issueDict){
                    completeBlock(("无法获取期次信息",["" : ""]))
                    return
                }
              
                self.issueName = String(format: "%@", issueDict["IssueName"] as! String)
                if self.issueName.count > 2{
//                    self.issueNameStr = self.issueName.substring(to: self.issueName.count - 2)
                }
                self.issueId = String(format: "%d", issueDict["IssueID"] as! Int) 
                self.endTime = issueDict["EndTime"] as! String
                self.currentTime =  issueDict["CurrentTime"] as! String
                self.awardTime =  issueDict["AwardTime"] as! String
                self.balance =   issueDict["Balance"] as! String
                
                 completeBlock(("", issueDict))
                
            }
            
        }
        
        
    }
    
    
    
    
}
