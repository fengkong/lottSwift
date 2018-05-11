//
//  NumberLotteryViewDelegate.swift
//  LotterySwift
//
//  Created by richard on 2018/5/7.
//  Copyright © 2018年 richard. All rights reserved.
//

import UIKit

@objc public protocol NumberLotteryViewDelegate: class {
    /**
     *  数字球长按事件,用于放大镜
     *
     *  @param text      <#text description#>
     *  @param isRedBall YES 是红球 NO 是篮球
     *  @param tag
     */
  @objc optional  func numberBallDidLongPress(ballText: String, isRedBall: Bool, tag: Int)
    /**
     *  处理单击事件
     *
     *  @param text      <#text description#>
     *  @param isRedBall <#isRedBall description#>
     */

     @objc optional func numberBallDidSelect(ballButton: UIButton, isRedBall: Bool)
    /**
     *   处理单击事件
     *   @param ballButton   点击的Button
     *   @param error        是否有错误
     */
    
     @objc optional func numberBallDidSelect(ballButton: UIButton, error: NSError)
    
    /**
     *  历史开奖数据
     *
     */
    
     @objc optional func historyButtonDidTouchInSide()
    
    /**
     *   数字长按事件
     *   @param button  点击的button
     */
    
    @objc optional func numberBallDidLongPress(button: UIButton)
    /**
     *   结束数字长按事件
     *   @param button  点击的button
     */
     @objc optional func numberBallEndLongPress(button: UIButton)
    /**
     *   显示历史开奖号码
     *   @param button  点击的button
     */
    
     @objc optional func numberBallHistoryLotteryNumButton(button: UIButton)
    /**
     *   保存上次选号
     *   @param button  点击的button
     */
    
     @objc optional func numberBallSaveData(button: UIButton)
    //scrollview 内容高度更新
    
    @objc optional func upDataScrollView(isShowLeave: Bool, isDanTuoType: Bool)
    
    
    
}


