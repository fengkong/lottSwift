//
//  DiscoverMainCell.swift
//  LotterySwift
//
//  Created by 孔峰 on 2018/5/9.
//  Copyright © 2018年 孔峰. All rights reserved.
//

import UIKit

class DiscoverMainCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = UITableViewCellSelectionStyle.none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func fillData(model: DiscoverModel) {
        icon.setImageWith(URL(string: model.iconurl), placeholder: UIImage(named: "bj_discover_default_icon"))
        titleLabel.text = model.name
        contentLabel.text = model.title
    }
}
