//
//  DLTNumberAreaView.swift
//  LotterySwift
//
//  Created by richard on 2018/4/28.
//  Copyright © 2018年 richard. All rights reserved.
//

import UIKit


class DLTNumberAreaView: UIView {
    
    weak var delegate: NumberLotteryViewDelegate?
    
    let headViewHeight: CGFloat = 40.0
    let blueLabelSpace: CGFloat = 15.0
    let leaveSpace: CGFloat = 15.0
    
    
    var ballMarginHeight: CGFloat!
    var leaveOutSpace: CGFloat!
    var blueLabel: UILabel!
    var roundBlueView: UIView!
    
    var isShowLeaveOut: Bool!
    
    let redBalls = NSMutableArray()
    let blueBalls = NSMutableArray()
    
    var lotteryNumber:BJDaletouNumber!
    var dltModel: BJDaletouModel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        leaveOutSpace = 0.0
        backgroundColor = RGB(r: 249, g: 249, b: 249)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func creatUpUI() {
        creatUpHistoryButton()
        
        creatBallAreaView()
    }
    
    func creatBallAreaView() {
        
        let edgeSpace: CGFloat = 8.0
        let edgeSpaceHeight: CGFloat = edgeSpace + leaveSpace
        let space: CGFloat = 6.0
        var totalTop = headViewHeight
        let width: CGFloat = (kScreenWidth - edgeSpace * 2 - 6 * space)/7
        
        for i in 0..<35 {
            
            var frame = CGRect()
            let numberOfLine: CGFloat = CGFloat(i/7)
            if i%7 == 0 {
                frame = CGRect(x: edgeSpace, y: totalTop + numberOfLine * width + numberOfLine * edgeSpaceHeight, width: width, height: width)
            }else{
                let numberOfRow = CGFloat(i % 7)
                frame = CGRect(x: numberOfRow * width + edgeSpace + numberOfRow * space, y: totalTop + numberOfLine * width + numberOfLine * edgeSpaceHeight, width: width, height: width)
            }
            
            
            let button = UIButton(frame: frame)
            button.tag = 88
            button.setTitle(String(format: "%02d", i + 1), for: UIControlState.normal)
            button.setTitleColor(GlobalRedColor, for: UIControlState.normal)
            button.setTitleColor(UIColor.white, for: UIControlState.selected)
            button.setBackgroundImage(UIImage(named: "jdd_redbollselected"), for: UIControlState.selected)
            button.setBackgroundImage(UIImage(named: "cicle_grey_border"), for: UIControlState.normal)
            button.setBackgroundImage(UIImage(named: "cicle_grey_highlighted"), for: UIControlState.highlighted)
            button.addTarget(self, action: #selector(ballOnClick(_:)), for: UIControlEvents.touchUpInside)
            self.addSubview(button)
            redBalls.add(button)
        }
        
        totalTop += edgeSpace * 2 + 5 * width + 4 * edgeSpaceHeight
        totalTop += edgeSpace
        
        setUpBlueLabel(totalTop: totalTop)
        
        for i in 0..<12 {
            var frame = CGRect()
            let numberOfLine = CGFloat(i / 7)
            if i % 7 == 0 {
                frame = CGRect(x: edgeSpace, y: totalTop + numberOfLine * width + numberOfLine * edgeSpaceHeight + edgeSpace * 2, width: width, height: width)
            }else{
                let numberOfRow = CGFloat(i % 7)
                frame = CGRect(x: numberOfRow * width + edgeSpace + numberOfRow * space, y: totalTop + numberOfLine * width + numberOfLine * edgeSpaceHeight + edgeSpace * 2, width: width, height: width)
            }
            
            
            let button = UIButton(frame: frame)
            button.tag = 99
            button.setTitle(String(format: "%02d", i + 1), for: UIControlState.normal)
            button.setTitleColor(GlobalBlueColor, for: UIControlState.normal)
            button.setTitleColor(UIColor.white, for: UIControlState.selected)
            button.setBackgroundImage(UIImage(named: "jdd_bulebollselected"), for: UIControlState.selected)
            button.setBackgroundImage(UIImage(named: "cicle_grey_border"), for: UIControlState.normal)
            button.setBackgroundImage(UIImage(named: "cicle_grey_highlighted"), for: UIControlState.highlighted)
            button.addTarget(self, action: #selector(ballOnClick(_:)), for: UIControlEvents.touchUpInside)
            addSubview(button)
            blueBalls.add(button)
        }
        
        
    }
    
    func creatRedBalls() {
        
        for button in redBalls as! [UIButton] {
            for number in lotteryNumber.headBallArray as! [NSNumber]{
                let selectNumber = Int((button.titleLabel?.text)!)
                if Int(truncating: number) == selectNumber {
                    button.isSelected = true
                }
            }
        }
        
        for button in blueBalls as! [UIButton]{
            for number in lotteryNumber.backBallArray as! [NSNumber]{
                let selectNumber = Int((button.titleLabel?.text)!)
                if Int(truncating: number) == selectNumber {
                    button.isSelected = true
                }
            }
        }
    }
    
    
    //设置历史和显示遗漏按钮
    func creatUpHistoryButton() {
        let titleView: UIView = UIView(frame: CGRect(x: 8, y: (headViewHeight - 11) * 0.5, width: 2, height: 11))
        titleView.layer.cornerRadius = 1
        titleView.layer.masksToBounds = true
        titleView.backgroundColor = UIColor(hexString: "d9d9d9")
        addSubview(titleView)
        
        creatLabel(frame: CGRect(x: 20, y: (headViewHeight - 15 ) * 0.5, width: 135, height: 15), title: "红球区 至少选择5个号", color: GlobalRedColor, range: NSRange(location: 8, length: 1), view: self)
    }
    
    
    func creatLabel(frame: CGRect, title: String, color: UIColor, range: NSRange, view: UIView)  {
        let detailLabel = UILabel(frame: frame)
        detailLabel.textColor = UIColor(hexString: "999999")
        detailLabel.font = UIFont.systemFont(ofSize: 12.0)
        view.addSubview(detailLabel)
        
        let attributeString = NSMutableAttributedString(string: title)
        attributeString.addAttributes([NSAttributedStringKey.foregroundColor: color], range: range)
        detailLabel.attributedText = attributeString
    }
    
    
    
    func setUpBlueLabel(totalTop: CGFloat) {
        
        if roundBlueView == nil {
            roundBlueView = UIView(frame: CGRect(x: 8, y: totalTop + 3.0 - blueLabelSpace + (blueLabelSpace - 11.0) * 0.5, width: 2, height: 11))
            roundBlueView.layer.cornerRadius = 1
            roundBlueView.layer.masksToBounds = true
            roundBlueView.backgroundColor = UIColor(hexString: "d9d9d9")
            addSubview(roundBlueView)
        }
        
        if blueLabel == nil{
            blueLabel = UILabel(frame: CGRect(x: 21, y: totalTop + 3 - blueLabelSpace + (blueLabelSpace - 15) * 0.5, width: 135, height: 15))
            blueLabel.textColor = UIColor(hexString: "999999")
            blueLabel.font = UIFont.systemFont(ofSize: 12.0)
            let attributeString = NSMutableAttributedString(string: "蓝球区 至少选择2个号")
            attributeString.addAttributes([NSAttributedStringKey.foregroundColor: GlobalBlueColor], range: NSRange(location: 8, length: 1))
            blueLabel.attributedText = attributeString
            addSubview(blueLabel)
            
        }
    }
    
    
    
    @objc func ballOnClick(_ button: UIButton){
        
        let selectNumber = Int((button.titleLabel?.text)!)
        var error = NSError()
        if selectNumber == 0 {
            return
        }
        
        delegate?.numberBallSaveData!(button: button)
        
        
        if button.tag == 88 {
            if button.isSelected == true{
                lotteryNumber.headBallArray.remove(NSNumber(integerLiteral: selectNumber!))
                button.isSelected = false
            }else{
                if lotteryNumber.headBallArray.count > 17 {
                    error = NSError(domain: "前区最多选择18个", code: 0, userInfo: nil)
                }else{
                    lotteryNumber.headBallArray.add(NSNumber(integerLiteral: selectNumber!))
                    button.isSelected = true
                }
            }
        }else if(button.tag == 99){
            if button.isSelected == true {
                lotteryNumber.backBallArray.remove(NSNumber(integerLiteral: selectNumber!))
            }else{
                lotteryNumber.backBallArray.add(NSNumber(integerLiteral: selectNumber!))
            }
            button.isSelected = !button.isSelected
        }
        
        delegate?.numberBallDidSelect!(ballButton: button, error: error)
        
        
    }

    
    override func draw(_ rect: CGRect) {
        
//        if isShowLeaveOut && !isEqual(dltModel) {
//            drawLeaveOutData()
//        }
    }
    
    
    func clearData(){
        for button in redBalls as! [UIButton] {
            button.isSelected = false
        }
        for button in blueBalls as! [UIButton] {
            button.isSelected = false
        }
    }
    
}

extension DLTNumberAreaView{
    func leaveClick(isShow: Bool){
        if isShow {
            isShowLeaveOut = true
        }else{
            isShowLeaveOut = false
        }
        delegate?.upDataScrollView!(isShowLeave: isShowLeaveOut, isDanTuoType: false)
        
        setNeedsDisplay()
        
        leaveOutSpace = isShowLeaveOut == true ? leaveSpace : -leaveSpace
        let blueViewY = leaveOutSpace * 4.0
        
        UIView.animate(withDuration: 0.1) {
            
            self.blueLabel.frame = CGRect(x: self.blueLabel.frame.origin.x, y: self.blueLabel.frame.origin.y + blueViewY + self.leaveOutSpace, width: self.blueLabel.frame.size.width, height: self.blueLabel.frame.size.height)
            
            self.roundBlueView.frame = CGRect(x: self.roundBlueView.frame.origin.x , y: self.roundBlueView.frame.origin.y + blueViewY + self.leaveOutSpace, width: self.roundBlueView.frame.size.width, height: self.roundBlueView.frame.size.height)
        }
        
        
        for button in redBalls as! [UIButton] {
            moveBallButton(button: button)
        }
        
        for button in blueBalls as! [UIButton] {
            moveBallButton(button: button)
        }
        
        
    }
    
    
    func moveBallButton(button: UIButton) {
        
        let buttonTitle = button.title(for: UIControlState.normal)
        let buttonValue = Int(buttonTitle!)
        
        let numberOfLine: CGFloat = CGFloat((buttonValue! - 1)/7)
        
        var buttonY: CGFloat = 0.0
        if button.tag == 88 {
            buttonY = button.frame.origin.y + leaveOutSpace * numberOfLine
        }else{
            buttonY = button.frame.origin.y + leaveOutSpace * 5 + leaveOutSpace * numberOfLine
        }
        
        UIView.animate(withDuration: 0.1) {
            button.frame = CGRect(x: button.frame.origin.x, y: buttonY, width: button.frame.size.width, height: button.frame.size.height)
        }
    }
    
    
}


extension DLTNumberAreaView{
    func isDLTNumberAreaViewNumberChange(lotteryNumber: BJDaletouNumber) -> Bool {
        
        let isChanged = false
        
        if lotteryNumber.headBallArray.count == lotteryNumber.headBallArray.count {
            
        
            
            
        }
        
        return false
    }
}


extension DLTNumberAreaView{
    func drawLeaveOutData(){
        for button in redBalls as! [UIButton] {
            let buttonX: CGFloat = button.frame.origin.x
            let buttonY: CGFloat = button.frame.origin.y
            let buttonH: CGFloat = button.frame.size.height
            let buttonW: CGFloat = button.frame.size.width
            
            let drawFrame = CGRect(x: buttonX, y: buttonY + buttonH + 3, width: buttonW, height: leaveSpace)
            
            var isRed = false
        }
    }
}
