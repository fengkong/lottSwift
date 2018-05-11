//
//  HomeSectionModel+CollectionView.swift
//  LotterySwift
//
//  Created by richard on 2018/4/23.
//  Copyright © 2018年 richard. All rights reserved.
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
