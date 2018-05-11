//
//  NewsCollectionViewCell.swift
//  LotterySwift
//
//  Created by 孔峰 on 2018/4/28.
//  Copyright © 2018年 孔峰. All rights reserved.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var icoImageView: UIImageView!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var redCountLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func fillData(model: NewsIndexModel){
        titleLabel.text = String(format: "%@", model.title)
        redCountLabel.text = String(format: "阅读%d", model.readCount)
        timeLabel.text = String(format: "%@", model.createTime)
        summaryLabel.text = String(format: "%@", model.source)
        icoImageView.setImageWith(URL(string: model.imgUrl), placeholder: UIImage(named: "new_news_default_icon"))
        titleLabel.textColor = UIColor(hexString: "333333")
        
    }

}
