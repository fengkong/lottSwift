//
//  AppConfigModel.swift
//  LotterySwift
//
//  Created by 孔峰 on 2018/5/2.
//  Copyright © 2018年 孔峰. All rights reserved.
//

import UIKit

class AppConfigModel: NSObject {
    
    lazy var appConfigDictionary: NSDictionary = {
        let filePath: String = Bundle.main.path(forResource: "AppConfig", ofType: "plist")!
        let appConfigDictionary = NSDictionary.init(contentsOfFile: filePath)!
        return appConfigDictionary
    }()
    
    lazy var httpsEnable: Bool = {
            return appConfigDictionary["HttpsEnable"] as! Bool
    }()
    
    lazy var talkingDataServiceTD: String = {
       return appConfigDictionary["TalkingDataServiceID"] as! String
    }()
    
    lazy var talkingDataAdTracking: String = {
        return appConfigDictionary["TalkingDataAdTracking"] as! String
    }()
    
    lazy var buglyServiceID: String = {
        return appConfigDictionary["BuglyServiceID"] as! String
    }()
    
    lazy var jsPatchID: String = {
        return appConfigDictionary["JsPatchServiceID"] as! String
    }()
    
    lazy var appID: String = {
        return appConfigDictionary["AppID"] as! String
    }()
    
    lazy var cmdName: String = {
        return appConfigDictionary["CmdName"] as! String
    }()
    
    lazy var url_push: String = {
        return (appConfigDictionary["urls"] as! NSDictionary)["push"] as! String
    }()
    
    lazy var url_report: String = {
        return (appConfigDictionary["urls"] as! NSDictionary)["report"] as! String
    }()
    
    lazy var url_info: String = {
        return (appConfigDictionary["urls"] as! NSDictionary)["info"] as! String
    }()
    lazy var url_dcds: String = {
        return (appConfigDictionary["urls"] as! NSDictionary)["dcds"] as! String
    }()
    lazy var java_user: String = {
        return (appConfigDictionary["urls"] as! NSDictionary)["java_user"] as! String
    }()
    lazy var java_base: String = {
        return (appConfigDictionary["urls"] as! NSDictionary)["java_base"] as! String
    }()
    lazy var java_order: String = {
        return (appConfigDictionary["urls"] as! NSDictionary)["java_order"] as! String
    }()
    lazy var java_trade: String = {
        return (appConfigDictionary["urls"] as! NSDictionary)["java_trade"] as! String
    }()
    lazy var java_master: String = {
        return (appConfigDictionary["urls"] as! NSDictionary)["java_master"] as! String
    }()
    
    lazy var java_activity: String = {
        return (appConfigDictionary["urls"] as! NSDictionary)["java_activity"] as! String
    }()
    lazy var java_rp: String = {
        return (appConfigDictionary["urls"] as! NSDictionary)["java_rp"] as! String
    }()
    lazy var java_site: String = {
        return (appConfigDictionary["urls"] as! NSDictionary)["java_site"] as! String
    }()
    lazy var java_admin: String = {
        return (appConfigDictionary["urls"] as! NSDictionary)["java_admin"] as! String
    }()
    
}
