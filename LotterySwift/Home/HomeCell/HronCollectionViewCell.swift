//
//  HronCollectionViewCell.swift
//  LotterySwift
//
//  Created by richard on 2018/4/26.
//  Copyright © 2018年 richard. All rights reserved.
//

import UIKit

protocol HronCollectionViewCellDelegate: class {
    func HornCollectionViewDidClick(model: KvModel)
    
}

class HronCollectionViewCell: UICollectionViewCell {

    
    lazy var timer: Timer = {
        let timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
        return timer
    }()
    
  
    
    func creareHornButton() -> UIButton {
        let button = UIButton(type: .custom)
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        button.setTitleColor(RGB(r: 150, g: 150, b: 150), for: UIControlState.normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byTruncatingTail
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return button
    }
    
    var hornDatas  = [KvModel](){
        didSet{
            mySynchronized(lock: self){
                timer.fireDate = NSDate.distantFuture
                currentButton?.removeFromSuperview()
                nextButton?.removeFromSuperview()
                currentButton = nil
                nextButton = nil
                
                if hornDatas.count > 0 {
                    
                    let firstData = hornDatas[0] as KvModel
                    let title = firstData.description0
                    currentButton = creareHornButton()
                    currentButton?.setTitle(title, for: UIControlState.normal)
                    currentButton?.frame = CGRect(x: 35, y: 0, width: kScreenWidth-35, height: frame.size.height)
                    currentButton?.titleLabel?.font = UIFont.systemFont(ofSize: 13)
                    currentButton?.addTarget(self, action: #selector(hronClick(_:)), for: UIControlEvents.touchUpInside)
                    self.addSubview(currentButton!)
                    
                }
                
                if hornDatas.count > 1 {
                    let hornModel = hornDatas[1] as KvModel
                    let title = hornModel.description0
                    nextButton = creareHornButton()
                    nextButton?.tag = 1
                    nextButton?.setTitle(title, for: UIControlState.normal)
                    nextButton?.frame = CGRect(x: 35, y: -frame.size.height, width: kScreenWidth - 35, height: frame.size.height)
                    nextButton?.titleLabel?.font = UIFont.systemFont(ofSize: 13)
                    nextButton?.addTarget(self, action: #selector(hronClick(_:)), for: UIControlEvents.touchUpInside)
                    self.addSubview(nextButton!)
                    
                }
            }
        }
    }
    var currentButton: UIButton!
    var nextButton: UIButton!
    var tempButton: UIButton!
    weak var delegate: HronCollectionViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
 
    
    func  startAutoScroll(){
        
        if hornDatas.count > 1 {
            let date = NSDate()
            timer.fireDate = date.addingTimeInterval(3) as Date
        }else{
            pauseAutoScroll()
        }
    }
    
    func pauseAutoScroll() {
        timer.fireDate = NSDate.distantFuture
    }
    
    
//    deinit {
//        timer.invalidate()
//    }
//    func releaseTimer(){
//        guard let time: Timer = self.timer else {
//            return
//        }
//        time.invalidate()
////        timer.timeInterval
//    }

}

extension HronCollectionViewCell{
    @objc private func hronClick(_ sender: UIButton){
        let hornModel = hornDatas[sender.tag]
//        if hornModel.isWinList {
//            return
//        }
        delegate?.HornCollectionViewDidClick(model: hornModel)
    }
    
    
    @objc private func autoScroll()  {
        mySynchronized(lock: self){
            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.currentButton?.center = CGPoint(x: (self.currentButton?.center.x)!, y: (self.currentButton?.center.y)! + (self.currentButton?.frame.size.height)!)
                self.nextButton?.center = CGPoint(x: (self.nextButton?.center.x)!, y: (self.nextButton?.center.y)! + (self.nextButton?.frame.size.height)!)
                
            }) { (finished) in
                if self.hornDatas.count > 0{
                    
                    var nIndex: Int = (self.nextButton?.tag)!
                    let cIndex: Int = (self.currentButton?.tag)!
                    self.currentButton?.center = CGPoint(x: (self.currentButton?.center.x)!, y: -(self.currentButton?.frame.size.height)!/2)
                    self.tempButton = self.nextButton
                    self.nextButton = self.currentButton
                    self.currentButton = self.tempButton
                    if (self.nextButton?.tag)! < (self.hornDatas.count) - 1 && (self.currentButton?.tag)! < (self.hornDatas.count) - 1{
                        self.currentButton?.tag = nIndex
                        nIndex += 1
                        self.nextButton?.tag = nIndex
                        let hornDataModel = self.hornDatas[self.nextButton.tag]
                        let title = hornDataModel.description0 as String
                        self.nextButton.setTitle(title, for: UIControlState.normal)
                        
                    }else if nIndex == self.hornDatas.count - 1{
                        
                        self.nextButton.tag = 0
                        let hornDataModel = self.hornDatas[self.nextButton.tag]
                        let title = hornDataModel.description0 as String
                        self.nextButton.setTitle(title, for: UIControlState.normal)
                        
                    }else if cIndex == self.hornDatas.count - 1{
                        
                        self.nextButton.tag = 1
                        let hornDataModel = self.hornDatas[self.nextButton.tag]
                        let title = hornDataModel.description0
                        self.nextButton.setTitle(title, for: UIControlState.normal)
                        
                    }
                    
                }
            }
        }
    }
}
