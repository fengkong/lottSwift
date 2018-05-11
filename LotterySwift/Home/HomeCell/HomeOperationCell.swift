//
//  HomeOperationCell.swift
//  LotterySwift
//
//  Created by 孔峰 on 2018/4/28.
//  Copyright © 2018年 孔峰. All rights reserved.
//

import UIKit

class HomeOperationCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var thiedImage: UIImageView!
    
    var opertionModels: NSArray!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func fillData(models: NSArray){
        
        opertionModels = models
        if opertionModels.count >= 3{
            let model1 = opertionModels[0] as! KvModel
            firstImage.setImageWith(URL(string: model1.imageUrl), placeholder: UIImage(named: "home_big_opertaion_default_icon"))
            
            let model2 = opertionModels[1] as! KvModel
            secondImage.setImageWith(URL(string: model2.imageUrl), placeholder: UIImage(named: "home_big_opertaion_default_icon"))
            
            let model3 = opertionModels[2] as! KvModel
            thiedImage.setImageWith(URL(string: model3.imageUrl), placeholder: UIImage(named: "home_big_opertaion_default_icon"))
        }
        
    }
    @IBAction func clickOpertionImg(_ sender: UIButton) {
        
        
        
        
    }
    
}
