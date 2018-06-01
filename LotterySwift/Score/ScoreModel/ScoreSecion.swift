//
//  ScoreSecion.swift
//  LotterySwift
//
//  Created by richard on 2018/5/11.
//  Copyright © 2018年 孔峰. All rights reserved.
//

import UIKit

enum BFLiveStateType: Int {
    case BFLiveStateTypeLiving = 0
    case BFLiveStateTypeFinished = 1
    case BFLiveStateTypeMyNote = 2
    
}

enum BFGameType: Int {
    case BFGameypeJCZQ = 90
    case BFGameTypeSFC = 10
    case BFGameTypeLQ = 91
}

class ScoreSecion: NSObject {
    
    var scoreModels: NSMutableArray!
    var showCount: Int!
    var issueName: String!
    var isOpen: Bool!
    
    private var index: Int!
    
    
    
    
    
}
