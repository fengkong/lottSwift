//
//  NumHistoryTableCell.swift
//  LotterySwift
//
//  Created by 孔峰 on 2018/5/2.
//  Copyright © 2018年 孔峰. All rights reserved.
//

import UIKit
import SnapKit

class NumHistoryTableCell: UITableViewCell {

    @IBOutlet weak var issueLabel: UILabel!
    @IBOutlet weak var blueNumLabel: UILabel!
    @IBOutlet weak var redNumBall: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let lineHeight: CGFloat = 1.0/UIScreen.main.scale
        let lineImageView = UIImageView()
        addSubview(lineImageView)
        lineImageView.image = UIImage(named: "separator_line")
        lineImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.left).offset(135)
            make.right.equalTo(self)
            make.bottom.equalTo(self)
            make.height.equalTo(lineHeight)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillData(dict: NSDictionary) {
        
//        let lottId = dict["LottID"] as! Int
        issueLabel.text = String(format: "%@期", dict["Issue"] as! String)
        let winStr = dict["WinNumber"] as! String
        var balls = NSArray()
        let range = winStr.range(of: "+")
        if range == nil {
            blueNumLabel.isHidden = true
            redNumBall.text = winStr
        }else{
            balls = winStr.components(separatedBy: "+") as NSArray
            blueNumLabel.isHidden = false
            redNumBall.text = balls.firstObject as? String
            blueNumLabel.text = balls.lastObject as? String
        }
    
        
        
        
        
        
    }
}
