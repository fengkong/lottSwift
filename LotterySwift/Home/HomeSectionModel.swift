//
//  HomeSectionModel.swift
//  LotterySwift
//
//  Created by richard on 2018/4/20.
//  Copyright © 2018年 richard. All rights reserved.
//

import UIKit

class HomeSectionModel: NSObject {

    var homeSectionType: HomeSectionType!
    var section: Int!
    var models = NSArray()
    var itemSize: CGSize!
    var referenceSizeForHeader: CGSize!
    var isShowHeader: Bool!
    var moreLotteryIndex: Int!
    typealias ReloadKvSection = () -> Void
    var reloadSection: ReloadKvSection?
    
    var reloadData:(() -> Void)?
    
    func parseData(dictionary: NSDictionary, isFirst: Bool) -> Bool{
        isShowHeader = isFirst
        let moduleId: Int = (dictionary["moduleId"] as? Int) ?? 0
        switch moduleId {
            case 2://新人福利
                p_parseAdsData(dictionary: dictionary)
                return true
            
            case 3://数字彩
                p_parseNumberLotteryData(dictionary: dictionary)
                return true
            
            case 4://热门赛事
                p_parseHotGameData(dictionary: dictionary)
                return true
            
            case 5://彩种
                p_parseLotteryData(dictionary: dictionary)
                return true
            
            case 6://运营位
                p_parseOperationData(dictionary: dictionary)
                return true
            
            case 7://信息播报
                let broadcast = (dictionary["info"] as! NSDictionary)["broadcast"] as! NSArray
                let winList = (dictionary["info"] as! NSDictionary)["winList"] as! NSArray
                if broadcast.count == 0 && winList.count == 0{
                    return false
                }
                p_parseBroadcastData(dictionary: dictionary)
                return true
            
            case 8://轮播图
                p_parseKVData(dictionary: dictionary)
                return true
            
            case 9://游戏入口
                break
            case 10://资讯
                p_parseNewsData(dictionary: dictionary)
                return true
            
            
            default:
                break
        }
         return false
    }
   
}

extension HomeSectionModel{
    
    private func p_parseAdsData(dictionary: NSDictionary){
        
        homeSectionType = .homeSectionTypeAds
        itemSize = CGSize(width: kScreenWidth, height: (kScreenWidth)*140.0/720.0)
        if isShowHeader {
            referenceSizeForHeader = CGSize(width: 0, height: 0)
        }else{
            referenceSizeForHeader = CGSize(width: kScreenWidth, height: 10)
        }
        let kvModels = NSMutableArray()
        let model = KvModel()
        model.parseAdsKVModel(dict: dictionary["info"] as! NSDictionary)
        kvModels.add(model)
        
        if !IsEmpty(thing: kvModels){
            models = kvModels
        }
    }
    
    private func p_parseNumberLotteryData(dictionary: NSDictionary){
        itemSize = CGSize(width: kScreenWidth, height: 135)
        if isShowHeader {
            referenceSizeForHeader = CGSize(width: 0, height: 0)
        }else{
            referenceSizeForHeader = CGSize(width: kScreenWidth, height: 10)
        }
        let kvModels = NSMutableArray()
        let model = HomeNumberLotteryModel.init(dict: dictionary["info"] as! [String : Any])
        kvModels.add(model)
        
       
        if !IsEmpty(thing: kvModels) {
            homeSectionType = .homeSectionTypeNumberLottery
            models = kvModels
        }
        
        
        
    }
    
    private func p_parseHotGameData(dictionary: NSDictionary){
        homeSectionType = .homeSectionTypeHotGame
        itemSize = CGSize(width: kScreenWidth, height: 245)
        if isShowHeader {
            referenceSizeForHeader = CGSize(width: 0, height: 0)
        }else{
            referenceSizeForHeader = CGSize(width: kScreenWidth, height: 8)
        }
        
        let kvModels = NSMutableArray()
        let arr = dictionary["info"] as! NSArray
        for itemDict in arr {
            let model = HomeHotGameModel(dict: itemDict as! [String: Any])
            kvModels.add(model)
        }
        
        if !IsEmpty(thing: kvModels) {
            models = kvModels
        }
        
        
    }
    
    private func p_parseLotteryData(dictionary: NSDictionary){
        if isShowHeader {
            referenceSizeForHeader = CGSize(width: 0, height: 0)
        }else{
            referenceSizeForHeader = CGSize(width: kScreenWidth, height: 10)
        }
        
        homeSectionType = .homeSectionTypeLottery
        itemSize = CGSize(width: (kScreenWidth)/2.0, height: 79.0)
        let lotteryModels = NSMutableArray()
        let lotteryList = dictionary["info"] as! NSArray
        for i in 0..<lotteryList.count {
            
            let itemDic = lotteryList[i]
            let model = HomeLotteryModel()
            model.parseBuyHallLotteryModel(dict: itemDic as! NSDictionary)
            
            let hepler = AppHelper.shared
            hepler.lotteryNameDictionay.setValue(String(format: "%@", model.lotteryName), forKey: String(format: "%d", model.lotteryId))
            hepler.lotteryNetIconDictionay.setValue(String(format: "%@", model.imageUrl), forKey: String(format: "%d", model.lotteryId))
            hepler.fastLotteryDictionay.setValue(String(format: "%@", model.jumpId), forKey: String(format: "%d", model.lotteryId))
            
            
            if (model.isShow as NSString).boolValue{
                lotteryModels.add(model)
            }
        }
        
        if !IsEmpty(thing: lotteryModels) {
            models = lotteryModels
            if models.count > 5{
                moreLotteryIndex = 5
            }else{
                moreLotteryIndex = models.count
            }
        }
    }
    
    private func p_parseOperationData(dictionary: NSDictionary){
        let operationModels = NSMutableArray()
        let operationList = dictionary["info"] as! NSArray
        for itemDic in operationList {
            let model = KvModel()
            model.parseBuyHallKVModel(dict: itemDic as! NSDictionary)
            operationModels.add(model)
        }
        if operationModels.count == 3 {
            homeSectionType = .homeSectionTypeOperation
            itemSize = CGSize(width: kScreenWidth, height: kScreenWidth*(240/720.0) + 52)
            if isShowHeader {
                referenceSizeForHeader = CGSize(width: 0, height: 0)
            }else{
                referenceSizeForHeader = CGSize(width: kScreenWidth, height: 10)
            }
            
            models = operationModels
        }
        
    }
    
    private func p_parseBroadcastData(dictionary: NSDictionary){
        homeSectionType = .homeSectionTypeBroadcast
        itemSize = CGSize(width: kScreenWidth, height: 30)
        if isShowHeader {
            referenceSizeForHeader = CGSize(width: 0, height: 0)
        }else{
            referenceSizeForHeader = CGSize(width: kScreenWidth, height: 10)
        }
        
        let kvModels = NSMutableArray()
        let broadCast = (dictionary["info"] as! NSDictionary)["broadcast"] as AnyObject
        
        if  broadCast.isKind(of: NSArray.self) && broadCast.count > 0 {
            for itemDic in broadCast as! NSArray{
                let model = KvModel()
                model.parseBuyHallKVModel(dict: itemDic as! NSDictionary)
                kvModels.add(model)
            }
        }else{
            let winList = (dictionary["info"] as! NSDictionary)["winList"] as AnyObject
            if  winList.isKind(of: NSArray.self) && winList.count > 0 {
                
                for itemDic in winList as! NSArray {
                    let model = KvModel()
                    model.parseWinListModel(dict: itemDic as! NSDictionary)
                    kvModels.add(model)
                }
            }
        }
        if !IsEmpty(thing: kvModels) {
            models = kvModels
        }
        
    }
    
    private func p_parseKVData(dictionary: NSDictionary){
        homeSectionType = .homeSectionTypeKv
        itemSize = CGSize(width: kScreenWidth, height: kScreenWidth * (326/750.0))
        if isShowHeader {
            referenceSizeForHeader = CGSize(width: kScreenWidth, height: 0)
        }else{
            referenceSizeForHeader = CGSize(width: kScreenWidth, height: 10)
        }
        
        let kvModels = NSMutableArray()
        let kvList = dictionary["info"] as! NSArray
        for itemDic in kvList {
            let model = KvModel()
            model.parseBuyHallKVModel(dict: itemDic as! NSDictionary)
            kvModels.add(model)
        }
        
        if !IsEmpty(thing: kvModels) {
            models = kvModels
        }
    }
    
    private func p_parseNewsData(dictionary: NSDictionary){
        homeSectionType = .homeSectionTypeNews
        if isShowHeader {
            referenceSizeForHeader = CGSize(width: kScreenWidth, height: 0)
        }else{
            referenceSizeForHeader = CGSize(width: kScreenWidth, height: 10)
        }
        itemSize = CGSize(width: kScreenWidth, height: 114)
        
        let news = dictionary["info"] as! NSArray
        
        let newsModels = NSMutableArray()
        
        for itemDic in news {
            let model = NewsIndexModel.deserialize(from: itemDic as? NSDictionary)
            newsModels.add(model!)
        }
        if !IsEmpty(thing: newsModels) {
            models = newsModels
        }
    }
}

enum HomeSectionType: Int {
    case homeSectionTypeKv = 0//kv
    case homeSectionTypeLottery = 1//彩种列表
    case homeSectionTypeGodRing = 2//大神擂台
    case homeSectionTypeBroadcast = 3//广播
    case homeSectionTypeNumberLottery = 4//数字彩
    case homeSectionTypeHotGame = 5//热们赛事
    case homeSectionTypeNews = 6//广播
    case homeSectionTypeAds = 7//广告
    case homeSectionTypeOperation = 8//运营位
}
