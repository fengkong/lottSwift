//
//  Common.swift
//  swiftBSBDJ
//
//  Created by 孔峰 on 2018/4/18.
//  Copyright © 2018年 孔峰. All rights reserved.
//

import UIKit

let kCellTextMargin: CGFloat = 10
let kCellHeaderHeight: CGFloat = 65
let kCellFooterHeight: CGFloat = 54
let kCellIamgeMaxH: CGFloat = 1500
let kCellImageBreakHeight: CGFloat = 250
let kStatusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
let iPhoneXHeight: CGFloat = 812
let kNavBarHeight:CGFloat = 44.0

/*代替之前的49*/
let kTabBarHeight: CGFloat = (UIApplication.shared.statusBarFrame.size.height > 20.0 ? 83.0:49.0)

/*代替之前的64*/
let kTopHeight = kStatusBarHeight + kNavBarHeight

let GlobalRedColor = RGB(r: 222, g: 50, b: 51)
let GlobalBlueColor = RGB(r: 85, g: 120, b: 202)

let kScreenWidth = UIScreen.main.bounds.width

let kScreenHeight = UIScreen.main.bounds.height


let lotteryPic = Bundle.main.path(forResource: "LotteryIco.plist", ofType: nil)



let   URL_PUSH = AppHelper.shared.appConfigModel.url_push
let   URL_REPORT = AppHelper.shared.appConfigModel.url_report
let   URL_INFO  = AppHelper.shared.appConfigModel.url_info
let   URL_DCDS  = AppHelper.shared.appConfigModel.url_dcds
let   URL_PATH       = "/dispatcher"
let   URL_PUSH_PATH  = "/jdd/public/safe/pushSet.do"
let   URL_REPORT_PATH    = "/report/public/api/safeMobileHandler.do"
let   URL_INFO_PATH    = "/info/public/safeMobileHandler.do"
let   URL_DCDS_PATH    = "/Api.Soccer.V3/Ajax/Live.ashx"


let   JAVA_USER   = AppHelper.shared.appConfigModel.java_user
let   JAVA_BASE   = AppHelper.shared.appConfigModel.java_base
let   JAVA_ORDER  = AppHelper.shared.appConfigModel.java_order
let   JAVA_TRADE  = AppHelper.shared.appConfigModel.java_trade
let   JAVA_MASTER  = AppHelper.shared.appConfigModel.java_master
let   JAVA_ACTIVITY = AppHelper.shared.appConfigModel.java_activity
let   JAVA_RP   = AppHelper.shared.appConfigModel.java_rp
let   JAVA_SITE  = AppHelper.shared.appConfigModel.java_site
let   JAVA_ADMIN  = AppHelper.shared.appConfigModel.java_admin

let   JAVA_USER_PATH = "/user/public/securityMobileHandler.do"
let   JAVA_BASE_PATH = "/basedata/public/securityMobileHandler.do"
let   JAVA_ORDER_PATH  = "/order/public/securityMobileHandler.do"
let   JAVA_TRADE_PATH  = "/trade/public/securityApiHandler.do"
let   JAVA_MASTER_PATH  = "/master/public/securityMobileHandler.do"
let   JAVA_ACTIVITY_PATH  = "/activity/public/mobileHandler.do"
let   JAVA_RP_PATH  = "/redpacket/public/handselMobileHandler.do"
let   JAVA_RP_RECHARGE_PATH  = "/redpacket/public/mobileHandler.do"
let   JAVA_SITE_PATH  = "/sitedata/public/securityMobileHandler.do"
let   JAVA_ADMIN_PATH  = "/appadmin/public/safeMobileHandler.do"

func RGB(r: CGFloat, g: CGFloat, b:CGFloat) -> UIColor {
    return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
}



func IsEmpty(thing: AnyObject) -> Bool{
    
//    thing.isnull
    return thing.count <= 0
//        thing == nil || thing.isnu || (thing.isKind(of: String.class) && thing.isEqual(to: "(null)"))
//        || (thing.responds(to: #selector(length))
//            && [(NSData *)thing length] == 0)
//        || ([thing respondsToSelector:@selector(count)]
//            && [(NSArray *)thing count] == 0)
}


func mySynchronized(lock: AnyObject, f:() -> ()) {
    objc_sync_enter(lock)
    f()
    objc_sync_exit(lock)
}

