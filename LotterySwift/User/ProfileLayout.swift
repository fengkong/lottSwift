//
//  ProfileLayout.swift
//  LotterySwift
//
//  Created by richard on 2018/5/9.
//  Copyright © 2018年 richard. All rights reserved.
//

import UIKit

class ProfileLayout: UICollectionViewFlowLayout {

    var scrollUpAction: ((CGFloat) -> Void)?
    var topBarsHeight: CGFloat!
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        topBarsHeight = 0.0
        let layoutAttributes = super.layoutAttributesForElements(in: rect)! as NSArray
        let contentInset = collectionView?.contentInset
        let contentOffset = collectionView?.contentOffset
        let minY = -(contentInset?.top)!
        
        if (contentOffset?.y)! < minY {
            let deltaY = fabs((contentOffset?.y)! - minY)
            if layoutAttributes.count > 0{
                for attributes in layoutAttributes as! [UICollectionViewLayoutAttributes]{
                    if attributes.indexPath.section == 0{
                        var frame = attributes.frame
                        frame.size.height = fmax(minY, 211 + deltaY)
                        
                        frame.origin.y = frame.origin.y - deltaY
                        attributes.frame = frame
                        break
                    }
                }
            }
        }else{
            let coverHeight: CGFloat = 211.0
            let coverHideHeight = coverHeight - topBarsHeight
            if (contentOffset?.y)! > coverHideHeight {
                let deltadY = fabs((contentOffset?.y)! - minY)
                if layoutAttributes.count > 0{
                    for attributes in layoutAttributes as! [UICollectionViewLayoutAttributes] {
                        if attributes.indexPath.section == 0{
                            var frame = attributes.frame
                            frame.origin.y = deltadY - coverHideHeight
                            attributes.frame = frame
                            attributes.zIndex = 1000
                            break
                        }
                    }
                }
            }
        }
        return layoutAttributes as? [UICollectionViewLayoutAttributes]
    }
    
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
