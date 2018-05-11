//
//  OpenBallLotteryCell.swift
//  LotterySwift
//
//  Created by richard on 2018/5/8.
//  Copyright © 2018年 richard. All rights reserved.
//

import UIKit

class OpenBallLotteryCell: UITableViewCell {

    @IBOutlet weak var issueLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var lotteryIcon: UIImageView!
    @IBOutlet weak var hTeam: UILabel!
    @IBOutlet weak var vTeam: UILabel!
    @IBOutlet weak var lotteryName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = UITableViewCellSelectionStyle.none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillData(model: OpenModel)  {
        lotteryName.text = model.lottName
        issueLabel.text = "第\(model.issue)期 \(model.showEndTime)"
        scoreLabel.text = model.score
        
        let lottId = Int(model.lottID)
        switch lottId {
        case LOTTERY_TYPE_ID_JCZQ:
            hTeam.text = String(format: "%@(%@)", model.hTeam,model.rq)
            vTeam.text = model.vTeam
            break
        case LOTTERY_TYPE_ID_JCLQ:
            hTeam.text = model.vTeam
            vTeam.text = model.hTeam
            break
        default:
            break
        }
        
        let helper = AppHelper.shared
        let imageStr = helper.lotteryIconDictionary[String(format: "%d", Int(model.lottID)!)] as? String ?? "jiang_default_icon"
        lotteryIcon.image = UIImage(named: imageStr)
        
    }
    
}
