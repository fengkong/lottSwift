//
//  RefreshHeader.swift
//  LotterySwift
//
//  Created by 孔峰 on 2018/4/27.
//  Copyright © 2018年 孔峰. All rights reserved.
//

import MJRefresh

class RefreshHeader: MJRefreshGifHeader {

    override func prepare() {
        super.prepare()
        
        var images = [UIImage]()
        
        for indedx in 0..<7 {
            let image = UIImage(named: "loding_\(indedx+1)")
            images.append(image!)
        }
        
        setImages(images, for: .idle)
        setImages(images, for: .refreshing)
        setTitle("", for: .idle)
        setTitle("", for: .pulling)
        setTitle("", for: .refreshing)
        
    }
    
    
    override func placeSubviews() {
        super.placeSubviews()
        
        gifView.contentMode = .center
        gifView.frame = CGRect(x: 0, y: 0, width: mj_w, height: 55)
        stateLabel.font = UIFont.systemFont(ofSize: 0)
        stateLabel.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        lastUpdatedTimeLabel.isHidden = true
    }
  

}



class MJRefreshFooter: MJRefreshAutoGifFooter {
    
    override func prepare() {
        super.prepare()
        
        mj_h = 50
        
        setTitle("上拉加载数据", for: .idle)
        setTitle("正在努力加载", for: .pulling)
        setTitle("正在努力加载", for: .refreshing)
        setTitle("没有更多数据啦", for: .noMoreData)
    }
    
    
    
    override func placeSubviews() {
        super.placeSubviews()
        gifView.frame.origin.x = 135
        gifView.centerY = stateLabel.centerY
    }
}

