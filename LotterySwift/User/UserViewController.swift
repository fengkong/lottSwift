//
//  UserViewController.swift
//  LotterySwift
//
//  Created by richard on 2018/4/23.
//  Copyright © 2018年 richard. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    @IBOutlet weak var userCollectionView: UICollectionView!
    
    @IBOutlet weak var naViView: UIView!
    @IBOutlet weak var newsBtn: UIButton!
    @IBOutlet weak var newsLabel: UILabel!
    @IBOutlet weak var customerBtn: UIButton!
    let profileLayout = ProfileLayout()
    
    
    lazy var secUserCenterModelArray : NSMutableArray = {
        let secUserCenterModelArray = NSMutableArray()
        secUserCenterModelArray.add(UserCenterModel(image: "jdd_chongzhi", tit: "充值", sub: "", isTip: true))
        secUserCenterModelArray.add(UserCenterModel(image: "jdd_titikuan", tit: "提款", sub: "", isTip: true))
        return secUserCenterModelArray
    }()
    
    lazy var thirdUserCenterModelArray: NSMutableArray = {
        let thirdUserCenterModelArray = NSMutableArray()
        thirdUserCenterModelArray.add(UserCenterModel(image: "bj_caijinka", tit: "彩金卡", sub: "暂无彩金卡", isTip: true))
        thirdUserCenterModelArray.add(UserCenterModel(image: "jdd_touzhujilu", tit: "购彩记录", sub: "自购订单", isTip: true))
        thirdUserCenterModelArray.add(UserCenterModel(image: "jdd_usercenter_flollow_icon", tit: "合买记录", sub: "合买订单", isTip: true))
        thirdUserCenterModelArray.add(UserCenterModel(image: "setting_follow", tit: "追号记录", sub: "追号订单", isTip: true))
        thirdUserCenterModelArray.add(UserCenterModel(image: "personal_massige", tit: "资金明细", sub: "资金流向", isTip: true))
        thirdUserCenterModelArray.add(UserCenterModel(image: "jdd_safe_center", tit: "安全中心", sub: "完善身份信息", isTip: true))
        thirdUserCenterModelArray.add(UserCenterModel(image: "more", tit: "更多选项", sub: "建议反馈", isTip: true))
        
        return thirdUserCenterModelArray
    }()
    
    lazy var userCenterModelArray: NSMutableArray = {
        let userCenterModelArray = NSMutableArray()
        userCenterModelArray.add(secUserCenterModelArray)
        userCenterModelArray.add(thirdUserCenterModelArray)
        return userCenterModelArray
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "我的"
        
        userCollectionView.collectionViewLayout = profileLayout
        userCollectionView.register(UINib.init(nibName: "UserCenterCollectionCell", bundle: nil), forCellWithReuseIdentifier: "UserCenterCollectionCell")
        userCollectionView.register(UINib.init(nibName: "UserCenterHeadCell", bundle: nil), forCellWithReuseIdentifier: "UserCenterHeadCell")
        userCollectionView.register(UINib.init(nibName: "UserCenterMoneyCell", bundle: nil), forCellWithReuseIdentifier: "UserCenterMoneyCell")
        userCollectionView.register(UINib.init(nibName: "UserCenterShadowView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "UserCenterShadowView")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension UserViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return userCenterModelArray.count + 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else{
            let array = userCenterModelArray[section - 1] as! NSMutableArray
            return array.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let headCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCenterHeadCell", for: indexPath) as! UserCenterHeadCell
            headCell.loginBlock = { [weak self] (button) in
                
                let loginContriller = BJLoginViewController()
                let nav = BJLoginNavigationController(rootViewController: loginContriller)
                self?.present(nav, animated: true, completion: nil)
                
            }
            return headCell
        }else if(indexPath.section == 1){
            let moneyCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCenterMoneyCell", for: indexPath) as! UserCenterMoneyCell
            let array = userCenterModelArray[indexPath.section - 1] as! NSMutableArray
            moneyCell.fillData(userModel: array[indexPath.row] as! UserCenterModel, indexPath: indexPath as IndexPath)
            return moneyCell
        }else{
            let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCenterCollectionCell", for: indexPath) as! UserCenterCollectionCell
             let array = userCenterModelArray[indexPath.section - 1] as! NSMutableArray
            collectionCell.fillData(userModel: array[indexPath.row] as! UserCenterModel)
            return collectionCell
        }
    }
}
extension UserViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0{
            return CGSize(width: kScreenWidth, height: 211)
        }else if indexPath.section == 1 {
            return CGSize(width: kScreenWidth / 2.0, height: 65)
        }else{
            return CGSize(width: kScreenWidth, height: 56)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
extension UserViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 2 {
            return CGSize(width: kScreenWidth, height: 10)
        }
        return CGSize(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let shadowView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "UserCenterShadowView", for: indexPath) as! UserCenterShadowView
        shadowView.backgroundColor = UIColor(hexString: "f9f9f9")
        return shadowView
    }
    
}

extension UserViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        var alpha = offsetY / 100.0
        if alpha > 0.05{
            alpha = alpha > 1 ? 1 : alpha
            if alpha > 0.99 {
                naViView.backgroundColor = UIColor(rgb: 0xF55b5b, alpha: 1)
            }else{
                 naViView.backgroundColor = UIColor(rgb: 0xF55b5b, alpha: alpha)
            }
        }else{
            naViView.backgroundColor = UIColor.clear
        }
    }
}
