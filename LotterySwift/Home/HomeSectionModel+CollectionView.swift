//
//  HomeSectionModel+CollectionView.swift
//  LotterySwift
//
//  Created by 孔峰 on 2018/4/23.
//  Copyright © 2018年 孔峰. All rights reserved.
//

import UIKit

extension HomeSectionModel{
    
    func collectionView(cpllectionview: UICollectionView, section: Int) -> Int{
      
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        
        return UICollectionViewCell()
    }
    func collectionView(collectionView: UICollectionView, kind: String, indexPath: IndexPath, selectBlock: @escaping(() -> ())) -> UICollectionReusableView {
        
        selectBlock()
        return UICollectionReusableView()
    }
    
}
