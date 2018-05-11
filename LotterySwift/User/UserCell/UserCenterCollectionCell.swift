//
//  UserCenterCollectionCell.swift
//  LotterySwift
//
//  Created by richard on 2018/5/9.
//  Copyright © 2018年 richard. All rights reserved.
//

import UIKit

class UserCenterCollectionCell: UICollectionViewCell {

    @IBOutlet weak var user_tip: UIImageView!
 
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func fillData(userModel: UserCenterModel){
        iconImage.image = UIImage(named: userModel.imageStr)
        titleLabel.text = userModel.title
        subTitleLabel.text = userModel.subTitle
        user_tip.isHidden = userModel.hiddenTip
    
    }

}
