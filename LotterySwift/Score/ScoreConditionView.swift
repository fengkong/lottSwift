//
//  ScoreConditionView.swift
//  LotterySwift
//
//  Created by richard on 2018/5/11.
//  Copyright © 2018年 孔峰. All rights reserved.
//

import UIKit

protocol ScoreConditionViewDelegate: class {
    func scoreConditionViewDidSelectCondition(index: Int)
}

class ScoreConditionView: UIView {
    weak var delegate: ScoreConditionViewDelegate?
}
