//
//  HomeLotteryIndexCell.swift
//  LotterySwift
//
//  Created by 孔峰 on 2018/4/23.
//  Copyright © 2018年 孔峰. All rights reserved.
//

import UIKit

class HomeLotteryIndexCell: UICollectionViewCell {
    @IBOutlet weak var lotteryImage: UIImageView!
    @IBOutlet weak var lotteryName: UILabel!
    
    @IBOutlet weak var infoIcon: UIImageView!
    @IBOutlet weak var tipsStates: UIImageView!
    @IBOutlet weak var tipsLabel: UILabel!
    @IBOutlet weak var tipsView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    func fillData(model: HomeLotteryModel, more: Bool, itemIndex: Int, canActivity: Bool)  {
        
        infoIcon.isHidden = true
        tipsView.isHidden = false
        
        if !more {
            lotteryImage.image = UIImage.lotteryIcon(lotteryId: model.lotteryId)
            lotteryName.text = String(format: "%@", model.lotteryName)
            
            if model.superScript.isEqual("开奖"){
                infoIcon.isHidden = false
                infoIcon.image = UIImage(named: "jdd_home_lottery_icon")
            }else if model.superScript.isEqual("加奖"){
                infoIcon.isHidden = false
                infoIcon.image = UIImage(named: "jdd_home_plus_award_icon")
            }else if model.superScript.isEqual("单关"){
                infoIcon.isHidden = false
                infoIcon.image = UIImage(named: "jdd_home_single_icon")
            }else{
                
                if model.isAddAwards == 2{
                    infoIcon.isHidden = false
                    infoIcon.image = UIImage(named: "jdd_home_lottery_icon")
                }else if model.isAddAwards == 1{
                    infoIcon.isHidden = false
                    infoIcon.image = UIImage(named: "jdd_home_plus_award_icon")
                }else{
                    infoIcon.isHidden = true
                }
            }
        }else{
            lotteryImage.image = UIImage(named: "lottery_more")
            lotteryName.text = "更多彩种"
        }
        
        tipsLabel.text = tipsTitle(lotteryId: model.lotteryId)
        if model.subTitle.count > 0 {
            tipsLabel.text = String(format: "%@", model.subTitle)
        }
        
        if model.isSubTitleLight {
            tipsLabel.textColor = .white
            tipsLabel.textAlignment = NSTextAlignment.center
            tipsStates.isHidden = false
        }else{
            tipsLabel.textColor = UIColor(hexString: "999999")
            tipsStates.isHidden = true
            tipsLabel.textAlignment = NSTextAlignment.left
        }
        
        
        
    }
    
    
    
    
}

extension HomeLotteryIndexCell{
    private func tipsTitle(lotteryId: Int) -> String{
        switch lotteryId {
        case LOTTERY_TYPE_ID_GXK3:
            return "每十分钟开奖"
        case LOTTERY_TYPE_ID_DALETOU:
            return "单注可中1600万";
        case LOTTERY_TYPE_ID_SHUANGSEQIU:
            return "单注可中1000万";
        case LOTTERY_TYPE_ID_JCZQ:
            return "热门赛事竞猜";
        case LOTTERY_TYPE_ID_JCLQ:
            return "热门篮球竞猜";
        case LOTTERY_TYPE_ID_BJZCDC:
            return "赛事丰富可单关";
        case LOTTERY_TYPE_ID_11YDJ:
            return "每十分钟开奖";
        case LOTTERY_TYPE_ID_XY11S5:
            return "每天84期";
        case LOTTERY_TYPE_ID_HL11S5:
            return "凌晨2点结束";
        case LOTTERY_TYPE_ID_RX9:
            return "竞猜9场分奖池";
        case LOTTERY_TYPE_ID_PL5:
            return "猜5位数字";
        case LOTTERY_TYPE_ID_FC3D:
            return "每日开奖";
        case LOTTERY_TYPE_ID_SF:
            return "2元可中500万";
        case LOTTERY_TYPE_ID_PL3:
            return "猜3位数字";
        case LOTTERY_TYPE_ID_JXK3:
            return "每十分钟开奖";
        case LOTTERY_TYPE_ID_JZDG:
            return "可猜单场";
        case LOTTERY_TYPE_ID_JLDG:
            return "可猜单场";
        case LOTTERY_TYPE_ID_HB11S5:
            return "每天84期";
        case LOTTERY_TYPE_ID_7XC:
            return "奖金最高500万";
        case LOTTERY_TYPE_ID_7LC:
            return "奖金最高500万";
        default:
            break
        }
        
        return ""
    }
}
