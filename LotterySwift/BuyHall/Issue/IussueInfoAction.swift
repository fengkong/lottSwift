//
//  IussueInfoAction.swift
//  LotterySwift
//
//  Created by 孔峰 on 2018/5/2.
//  Copyright © 2018年 孔峰. All rights reserved.
//

import UIKit

class IussueInfoAction: BJAction {

    
    override func execute(input: Any) {
        let alamofire = BJAlamofire()
        alamofire.loadRequestData(url: JAVA_BASE, path: JAVA_BASE_PATH, action: "200", param: ["LottID" : "39"]) { (isSuccess, data) in
            
            self.complateHandler(isSuccess, data)
        }
        
    }
}
