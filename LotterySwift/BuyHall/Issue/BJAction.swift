//
//  BJAction.swift
//  LotterySwift
//
//  Created by 孔峰 on 2018/5/2.
//  Copyright © 2018年 孔峰. All rights reserved.
//

import UIKit

typealias JDDCommandCompletionBlock = (Any, Any) -> Void
typealias JDDCommandCancelBlock = () -> Void

class BJAction: NSObject {

    
    var executing: Bool!
    var host: Any!
    var error: NSError!
    
    var complateHandler: JDDCommandCompletionBlock!
    var cancelHandler: JDDCommandCancelBlock!
    
    
    init(host: Any) {
        super.init()
        self.host = host
    }
    
    
    func execute(input: Any) {
        
    }
    
    func cancel() {
    }
    
    
}
