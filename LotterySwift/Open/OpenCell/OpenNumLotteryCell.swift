//
//  OpenNumLotteryCell.swift
//  LotterySwift
//
//  Created by richard on 2018/5/8.
//  Copyright © 2018年 richard. All rights reserved.
//

import UIKit

class OpenNumLotteryCell: UITableViewCell {

    @IBOutlet weak var lotteryName: UILabel!
    
    @IBOutlet weak var lotteryIssue: UILabel!
    
    @IBOutlet var ballBtn: [UIButton]!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = UITableViewCellSelectionStyle.none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension OpenNumLotteryCell{
    
    func fillData(lotteryModel: OpenModel){
        lotteryName.text = lotteryModel.lottName
        lotteryIssue.text = "第\(lotteryModel.issue)期 \(lotteryModel.showEndTime)"
        
        let lottId = Int(lotteryModel.lottID)
        if lottId == LOTTERY_TYPE_ID_SHUANGSEQIU || lottId == LOTTERY_TYPE_ID_DALETOU || lottId == LOTTERY_TYPE_ID_7LC {
            
            for i in 0..<ballBtn.count{
                let button = ballBtn[i]
                button.isHidden = false
                if i < lotteryModel.redWinNumbers.count{
                    button.setBackgroundImage(UIImage(named: "jdd_redbollselected"), for: UIControlState.normal)
                    button.setTitle((lotteryModel.redWinNumbers[i] as! String), for: UIControlState.normal)
                }else if i >= lotteryModel.redWinNumbers.count && i < (lotteryModel.redWinNumbers.count + lotteryModel.blueWinNumbers.count){
                    button.setBackgroundImage(UIImage(named: "jdd_bulebollselected"), for: UIControlState.normal)
                    button.setTitle((lotteryModel.blueWinNumbers[i - lotteryModel.redWinNumbers.count] as! String), for: UIControlState.normal)
                }else{
                    button.isHidden = true
                }
            }
        }else{
            
            for i in 0..<ballBtn.count{
                let button = ballBtn[i]
                if i < lotteryModel.redWinNumbers.count{
                    button.setBackgroundImage(UIImage(named: "jdd_redbollselected"), for: UIControlState.normal)
                    button.setTitle((lotteryModel.redWinNumbers[i] as! String), for: UIControlState.normal)
                     button.isHidden = false
                }else{
                     button.isHidden = true
                }
            }
        }
    }
}
