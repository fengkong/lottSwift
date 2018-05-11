//
//  OpenSFCLotteryCell.swift
//  LotterySwift
//
//  Created by 孔峰 on 2018/5/8.
//  Copyright © 2018年 孔峰. All rights reserved.
//

import UIKit

class OpenSFCLotteryCell: UITableViewCell {

    @IBOutlet weak var lotteryName: UILabel!
    @IBOutlet weak var lotteryIssue: UILabel!
    @IBOutlet var ballNums: [UIButton]!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = UITableViewCellSelectionStyle.none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillData(model: OpenModel) {
        lotteryName.text = model.lottName
        lotteryIssue.text = "第\(model.issue)期 \(model.showEndTime)"
        
        for button in ballNums{
            button.setTitle(model.redWinNumbers[button.tag] as? String, for: UIControlState.normal)
        }
    }
}
