//
//  HomeIndexViewController.swift
//  LotterySwift
//
//  Created by richard on 2018/4/20.
//  Copyright © 2018年 richard. All rights reserved.
//

import UIKit
import SwiftyJSON
import MJRefresh

class HomeIndexViewController: UIViewController {

    @IBOutlet weak var homeCollectionView: UICollectionView!
    var sections = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "首页"
        
        homeCollectionView.register(UINib.init(nibName: "BuyHallKvCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BuyHallKvCollectionViewCell")
        homeCollectionView.register(UINib.init(nibName: "HronCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HronCollectionViewCell")
        homeCollectionView.register(UINib.init(nibName: "HomeLotteryIndexCell", bundle: nil), forCellWithReuseIdentifier: "HomeLotteryIndexCell")
        homeCollectionView.register(UINib.init(nibName: "SSQInvestCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SSQInvestCollectionViewCell")
        homeCollectionView.register(UINib.init(nibName: "DLTInvestCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DLTInvestCollectionViewCell")
        homeCollectionView.register(UINib.init(nibName: "HomeAdsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeAdsCollectionViewCell")
        homeCollectionView.register(UINib.init(nibName: "HomeOperationCell", bundle: nil), forCellWithReuseIdentifier: "HomeOperationCell")
        homeCollectionView.register(UINib.init(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewsCollectionViewCell")
        homeCollectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "UICollectionReusableView")
        
        homeCollectionView.mj_header = RefreshHeader(refreshingBlock: { [weak self] in
            self?.requestData()
        })
        homeCollectionView.mj_header.beginRefreshing()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension HomeIndexViewController {
    func requestData()  {
        let alamofire = BJAlamofire()
        alamofire.loadRequestData(url: JAVA_ADMIN, path: JAVA_ADMIN_PATH,action: "903302", param: ["":""]){ (isSuccess, data) in
            self.homeCollectionView.mj_header.endRefreshing()
            
            guard isSuccess else {
                return
            }
            let arrar: NSArray = JSON(data).arrayObject!  as NSArray
            let sectionModels = NSMutableArray()
            var sectionIndex: Int = 0
            for i in 0..<arrar.count{
                let sectionModel = HomeSectionModel()
                let canParseByClint = sectionModel.parseData(dictionary: arrar[i] as! NSDictionary, isFirst: i == 0) ;
                if canParseByClint {
                    sectionIndex += 1
                    sectionModel.section = sectionIndex
                    sectionModels.add(sectionModel)
                }
            }
            
            if !IsEmpty(thing: sectionModels){
                self.sections = sectionModels.copy() as! NSArray
                self.homeCollectionView.reloadData()
                
            }
        }
    }
}
//UICollectionViewDataSource
extension HomeIndexViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        let model = HomeSectionModel()
        
        let sectionModel = sections[section] as! HomeSectionModel
        switch sectionModel.homeSectionType {
        case .homeSectionTypeKv: return 1
        case .homeSectionTypeGodRing: return 1
        case .homeSectionTypeBroadcast: return 1
        case .homeSectionTypeAds: return 1
        case .homeSectionTypeOperation: return 1
        case .homeSectionTypeNumberLottery: return 1
        case .homeSectionTypeHotGame: return 1
        case .homeSectionTypeLottery:
            return sectionModel.models.count > 5 ? sectionModel.moreLotteryIndex + 1 : sectionModel.moreLotteryIndex
        default:
            break
        }
        return sectionModel.models.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
         let sectionModel = sections[indexPath.section] as! HomeSectionModel
        
        switch sectionModel.homeSectionType {
        case .homeSectionTypeKv:
            let kvCell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "BuyHallKvCollectionViewCell", for: indexPath) as! BuyHallKvCollectionViewCell
            kvCell.parseData(models: sectionModel.models as! [KvModel])
             return kvCell
        case .homeSectionTypeBroadcast:
            let broadCell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "HronCollectionViewCell", for: indexPath) as! HronCollectionViewCell
            broadCell.hornDatas = sectionModel.models as! [KvModel]
            broadCell.delegate = self
            broadCell.startAutoScroll()
            return broadCell
        case .homeSectionTypeLottery:
            let broadCell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeLotteryIndexCell", for: indexPath) as! HomeLotteryIndexCell
            let lotteryModel = sectionModel.models[indexPath.row] as! HomeLotteryModel
            broadCell.fillData(model: lotteryModel, more: sectionModel.moreLotteryIndex == indexPath.item && sectionModel.models.count > 6, itemIndex: indexPath.item , canActivity: true)
            return broadCell
        case .homeSectionTypeNumberLottery:
            let lotteryModel = sectionModel.models[indexPath.item] as! HomeNumberLotteryModel
            let codeStr = lotteryModel.lotteryCode as String
            if codeStr.isEqual("SSQ") {
                let ssqCell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "SSQInvestCollectionViewCell", for: indexPath) as! SSQInvestCollectionViewCell
                ssqCell.parseModel(model: lotteryModel)
                return ssqCell
            }else{
                let dltCell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "DLTInvestCollectionViewCell", for: indexPath) as! DLTInvestCollectionViewCell
                dltCell.parseModel(model: lotteryModel)
                return dltCell
            }
        case .homeSectionTypeOperation:
            let opertionCell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeOperationCell", for: indexPath) as! HomeOperationCell
            opertionCell.fillData(models: sectionModel.models)
            return opertionCell
        case .homeSectionTypeAds:
            let adsCell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeAdsCollectionViewCell", for: indexPath) as! HomeAdsCollectionViewCell
            adsCell.fillData(kvModels: sectionModel.models as! [KvModel])
            return adsCell
        case .homeSectionTypeNews:
            let newsCell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as! NewsCollectionViewCell
            let newsModel = sectionModel.models[indexPath.row] as! NewsIndexModel
            newsCell.fillData(model: newsModel)
            return newsCell
        default:
            break
        }
        let kvCell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "BuyHallKvCollectionViewCell", for: indexPath) as! BuyHallKvCollectionViewCell
       
        return kvCell
    }
    
    
}
extension HomeIndexViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sectionModel = sections[indexPath.section] as! HomeSectionModel
        return sectionModel.itemSize
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let sectionModel = sections[section] as! HomeSectionModel
        return  sectionModel.referenceSizeForHeader
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = homeCollectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "UICollectionReusableView", for: indexPath)
        view.backgroundColor = RGB(r: 249, g: 249, b: 249)
        return view
    }
    
}
//UICollectionViewDelegate
extension HomeIndexViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sectionModel = sections[indexPath.section] as! HomeSectionModel
        switch sectionModel.homeSectionType {
        case .homeSectionTypeKv:
      
           break
        case .homeSectionTypeBroadcast:
           break
        case .homeSectionTypeLottery:
            
            if indexPath.item == sectionModel.moreLotteryIndex && sectionModel.models.count > 7 {
                let moreController = MoreLotteryIndexViewController()
                moreController.models = sectionModel.models
                moreController.hidesBottomBarWhenPushed = true
                navigationController?.pushViewController(moreController, animated: true)
                return
            }
            let model = sectionModel.models[indexPath.row] as! HomeLotteryModel
            
            if model.lotteryId == LOTTERY_TYPE_ID_DALETOU{
                let dltController = DLTViewController()
                dltController.hidesBottomBarWhenPushed = true
                navigationController?.pushViewController(dltController, animated: true)
            }
            
           break
        case .homeSectionTypeNumberLottery:
           break
        case .homeSectionTypeOperation:
           break
        case .homeSectionTypeAds:
           break
        case .homeSectionTypeNews:
     break
        default:
            break
        }
    }
    
    
//    collectionview
}

extension HomeIndexViewController: HronCollectionViewCellDelegate{
    func HornCollectionViewDidClick(model: KvModel) {
        print("轮播图点击")
    }
    
    
}
