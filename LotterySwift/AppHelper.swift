//
//  AppHelper.swift
//  LotterySwift
//
//  Created by richard on 2018/4/28.
//  Copyright © 2018年 richard. All rights reserved.
//

import UIKit

class AppHelper: NSObject {

    
    static let shared = AppHelper()
    
    private override init() {}
    
    override func copy() -> Any {
        return self
    }
    
    override func mutableCopy() -> Any {
        return self
    }
    
    lazy var  lotteryNetIconDictionay: NSMutableDictionary = {
       let lotteryNetIconDictionay = NSMutableDictionary()
       return lotteryNetIconDictionay
    }()
    
    lazy var lotteryNameDictionay: NSMutableDictionary = {
       let lotteryNameDictionay = NSMutableDictionary ()
       return lotteryNameDictionay
    }()
    
    lazy var fastLotteryDictionay: NSMutableDictionary = {
       let fastLotteryDictionay = NSMutableDictionary()
       return fastLotteryDictionay
    }()
    
    lazy var lotteryIconDictionary: NSDictionary = {
        let lotteryIconstr = Bundle.main.path(forResource: "LotteryIco", ofType: "plist")
        let lotteryIconDictionary = NSDictionary(contentsOfFile: lotteryIconstr!)
        return lotteryIconDictionary!
    }()
    
    lazy var appConfigModel: AppConfigModel = {
        return AppConfigModel()
    }()
}
