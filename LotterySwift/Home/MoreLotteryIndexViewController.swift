//
//  MoreLotteryIndexViewController.swift
//  LotterySwift
//
//  Created by richard on 2018/5/10.
//  Copyright © 2018年 richard. All rights reserved.
//

import UIKit

class MoreLotteryIndexViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var reloadSortLotteryBlock: ((NSArray) -> Void)?
    var models = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "更多彩种"
        configNavigationBackItem()
        collectionView.register(UINib.init(nibName: "HomeLotteryIndexCell", bundle: nil), forCellWithReuseIdentifier: "HomeLotteryIndexCell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension MoreLotteryIndexViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let lotteryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeLotteryIndexCell", for: indexPath) as! HomeLotteryIndexCell
        let model = models[indexPath.row] as! HomeLotteryModel
        lotteryCell.fillData(model: model, more: false, itemIndex: indexPath.item, canActivity: false)
        return lotteryCell
    }
}
extension MoreLotteryIndexViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: kScreenWidth/2.0, height: 79.0)
    }
    
}
extension MoreLotteryIndexViewController: UICollectionViewDelegate{
    
}
