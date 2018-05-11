//
//  OpenModel.swift
//  LotterySwift
//
//  Created by 孔峰 on 2018/5/8.
//  Copyright © 2018年 孔峰. All rights reserved.
//

import UIKit


enum LotteryOpenType: Int {
    case lotteryOpenType_Sports = 1
    case lotteryOpenType_Num = 2
    case lotteryOpenType_Hf = 3
}

class OpenModel: NSObject {

    var endTime = ""
    var issue = ""
    var issueID = ""
    var lottID = ""
    var lottName = ""
    var winNumber = ""
    var groupType = ""
    var orderNumber = ""
    var showEndTime = ""
    
    var hTeam = ""
    var mNo = ""
    var nMm = ""
    var rq = ""
    var score = ""
    var vTeam = ""
    var hRz = ""
    
    let redWinNumbers = NSMutableArray()
    let blueWinNumbers = NSMutableArray()
    
    var lotteryType: LotteryOpenType!
    
    init(dict: NSDictionary){
        
        endTime = String(format: "%@", dict["EndTime"] as? String ?? "")
        issue = String(format: "%@", dict["Issue"] as? String ?? "")
        issueID = String(format: "%@", dict["IssueID"] as? String ?? "")
        lottID = String(format: "%d", dict["LottID"] as? Int ?? 0)
        lottName = String(format: "%@", dict["LottName"] as? String ?? "")
        winNumber = String(format: "%@", dict["WinNumber"] as? String ?? "")
        groupType = String(format: "%@", dict["groupType"] as? String ?? "")
        orderNumber = String(format: "%@", dict["orderNumber"] as? String ?? "")
        
        hTeam = String(format: "%@", dict["HTeam"] as? String ?? "")
        mNo = String(format: "%@", dict["MNo"] as? String ?? "")
        nMm = String(format: "%@", dict["NMm"] as? String ?? "")
        rq = String(format: "%d", dict["Rq"] as? Int ?? 0)
        score = String(format: "%@", dict["Score"] as? String ?? "")
        vTeam = String(format: "%@", dict["VTeam"] as? String ?? "")
        hRz = String(format: "%@", dict["hRz"] as? String ?? "")
        
        if  endTime.count > 16 {
            let time = endTime as NSString
            showEndTime = time.substring(with: NSRange(location: 5, length: 5))
        }else{
            showEndTime = endTime
        }
        
        let hTeamStr = NSString(format: "%@", dict["HTeam"] as? String ?? "")
        if hTeamStr.length > 5 {
            hTeam = hTeamStr.substring(to: 5)
        }else{
            hTeam = hTeamStr as String
        }
        
        
        let vTeamStr = NSString(format: "%@", dict["VTeam"] as? String ?? "")
        if vTeamStr.length > 5 {
            vTeam = vTeamStr.substring(to: 5)
        }else{
            vTeam = vTeamStr as String
        }
        
        let lotteryInt = Int(groupType)
        if lotteryInt == 1 {
            lotteryType = LotteryOpenType.lotteryOpenType_Sports
        }else if lotteryInt == 2 {
            lotteryType = LotteryOpenType.lotteryOpenType_Num
        }else if lotteryInt == 3 {
            lotteryType = LotteryOpenType.lotteryOpenType_Hf
        }
        
        
        let lottId = Int(lottID)
        
        if lottId == LOTTERY_TYPE_ID_SHUANGSEQIU ||  lottId == LOTTERY_TYPE_ID_DALETOU ||  lottId == LOTTERY_TYPE_ID_7LC {
            let allBalls = winNumber.components(separatedBy: "+") as NSArray
            let redBallStr = allBalls.firstObject as! String
            let blueBallStr = allBalls.lastObject as! String
            let redNums = NSMutableArray(array: redBallStr.components(separatedBy: " "))
            let blueNums = NSMutableArray(array: blueBallStr.components(separatedBy: " "))
            
            let lastRed = redNums.lastObject as! NSString
            if lastRed.isEqual(to: ""){
                redNums.remove("")
            }
            
            let lastBlue = blueNums.firstObject as! NSString
            if lastBlue.isEqual(to: ""){
                blueNums.remove("")
            }
            
            redWinNumbers.addObjects(from: redNums as! [String])
            blueWinNumbers.addObjects(from: blueNums as! [String])
            
        }else if lottId == LOTTERY_TYPE_ID_SF || lottId == LOTTERY_TYPE_ID_FC3D || lottId == LOTTERY_TYPE_ID_7XC || lottId == LOTTERY_TYPE_ID_PL3 || lottId == LOTTERY_TYPE_ID_PL5{
            
            let winStr = winNumber as NSString
            for i in 0..<winNumber.count{
                redWinNumbers.add(winStr.substring(with: NSRange(location: i, length: 1)))
            }
            
        }else{
            let redNums = winNumber.components(separatedBy: " ")
            redWinNumbers.addObjects(from: redNums)
        }
    }
}
