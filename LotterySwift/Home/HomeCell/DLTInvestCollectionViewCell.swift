//
//  DLTInvestCollectionViewCell.swift
//  LotterySwift
//
//  Created by 孔峰 on 2018/4/27.
//  Copyright © 2018年 孔峰. All rights reserved.
//

import UIKit

class DLTInvestCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet var redBall: [UILabel]!
    @IBOutlet var blueBall: [UILabel]!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var chaseButton: UIButton!
    
    let dltNumber = BJDaletouNumber()
    
    var lotteryModel: HomeNumberLotteryModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        buyButton.isUserInteractionEnabled = false
        refreshButton.layer.borderColor = UIColor(hexString: "f6f6f6")?.cgColor
        for label in redBall {
            label.backgroundColor =  UIColor(hexString: "feeeee")
            label.layer.borderColor = GlobalRedColor.cgColor
        }
        
        for label in blueBall {
            label.backgroundColor =  UIColor(hexString: "eef5fe")
            label.layer.borderColor = GlobalBlueColor.cgColor
        }
        
        
       
       
    }
    
    
    func parseModel(model: HomeNumberLotteryModel) {
        lotteryModel = model
        if lotteryModel.money != nil {
            moneyLabel.text = String(format: "%@ 亿", lotteryModel.money)
        }else{
            moneyLabel.text = String(format: "%@ 亿", "0")
        }
        
        if model.zhshow && model.zhurl != nil  {
            chaseButton.isHidden = false
        }else{
            chaseButton.isHidden = true
        }
        
         randomBall()
        
    }

    @IBAction func refreshButtonClick(_ sender: UIButton) {
        
        randomBall()
    }
    
}

extension DLTInvestCollectionViewCell {
    
    fileprivate func randomBall(){
        
        dltNumber.headBallArray.removeAllObjects()
        dltNumber.backBallArray.removeAllObjects()
        
        dltNumber.headBallArray.addObjects(from: dltNumber.generateBallNumber(count: 5, number: 35))
        dltNumber.backBallArray.addObjects(from: dltNumber.generateBallNumber(count: 2, number: 12))
        
        dltNumber.headBallArray.enumerateObjects { (obj, idx, arg)  in
            
            let label = redBall[idx]
            let number = obj as! NSNumber
            label.text = String(format: "%02ld", Int(truncating: number))
        }
        
        dltNumber.backBallArray.enumerateObjects { (obj, idx, ard) in
            let label = blueBall[idx]
            let number = obj as! NSNumber
            label.text = String(format: "%02ld", Int(truncating: number))
        }
        
    }
}
