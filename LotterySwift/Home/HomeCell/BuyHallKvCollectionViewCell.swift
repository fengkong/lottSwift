//
//  BuyHallKvCollectionViewCell.swift
//  LotterySwift
//
//  Created by 孔峰 on 2018/4/23.
//  Copyright © 2018年 孔峰. All rights reserved.
//

import UIKit
import ZCycleView

class BuyHallKvCollectionViewCell: UICollectionViewCell {

    
    lazy var cycleView: ZCycleView = {
        let cycleView = ZCycleView(frame: self.bounds)
        cycleView.placeholderImage = UIImage(named: "home_hall_banner_default_icon")
        
        self.addSubview(cycleView)
        return cycleView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func parseData(models: [KvModel]) {
        
        let array = NSMutableArray()
        for model in models {
            array.add(model.imageUrl)
        }
        
        cycleView.setUrlsGroup(array as! Array<String>)
        
    }
}
