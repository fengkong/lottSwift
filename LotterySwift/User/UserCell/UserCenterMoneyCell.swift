//
//  UserCenterMoneyCell.swift
//  LotterySwift
//
//  Created by richard on 2018/5/9.
//  Copyright © 2018年 richard. All rights reserved.
//

import UIKit

class UserCenterMoneyCell: UICollectionViewCell {
    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func fillData(userModel: UserCenterModel, indexPath: IndexPath){
        iconImage.image = UIImage(named: userModel.imageStr)
        titleLabel.text = userModel.title
        if indexPath.row == 0 {
            lineView.isHidden = false
        }else{
            lineView.isHidden = true
        }
    }

}
