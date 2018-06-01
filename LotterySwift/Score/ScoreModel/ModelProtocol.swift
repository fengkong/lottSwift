//
//  ModelProtocol.swift
//  LotterySwift
//
//  Created by richard on 2018/5/11.
//  Copyright © 2018年 孔峰. All rights reserved.
//

import Foundation

protocol ModelProtocol: class {
    func parseData(rowDictionary: NSDictionary, userInfo: NSDictionary)
}
