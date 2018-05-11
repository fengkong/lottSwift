//
//  HomeAdsCollectionViewCell.swift
//  LotterySwift
//
//  Created by richard on 2018/4/27.
//  Copyright © 2018年 richard. All rights reserved.
//

import UIKit

class HomeAdsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var adImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func fillData(kvModels: [KvModel]) {
        self.backgroundColor = UIColor(hexString: "f6f6f6")
        
        let model = kvModels[0]
        
        adImageView.setImageWith(URL(string: model.imageUrl), placeholder: UIImage(named: "ads_default_icon"), options: YYWebImageOptions.useNSURLCache) { (image, url, form, stage, error) in
            
        }
    }
}
