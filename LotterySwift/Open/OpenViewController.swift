//
//  OpenViewController.swift
//  LotterySwift
//
//  Created by 孔峰 on 2018/4/23.
//  Copyright © 2018年 孔峰. All rights reserved.
//

import UIKit
import SwiftyJSON
import MJRefresh

class OpenViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var openArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "开奖"
        
        
        tableView.register(UINib.init(nibName: "OpenNumLotteryCell", bundle: nil), forCellReuseIdentifier: "OpenNumLotteryCell")
        tableView.register(UINib.init(nibName: "OpenBallLotteryCell", bundle: nil), forCellReuseIdentifier: "OpenBallLotteryCell")
        tableView.register(UINib.init(nibName: "OpenSFCLotteryCell", bundle: nil), forCellReuseIdentifier: "OpenSFCLotteryCell")
        
        tableView.mj_header = RefreshHeader(refreshingBlock: { [weak self] in
            self?.requestOpenLotteryData(isShowHud: false)
        })
        tableView.mj_header.beginRefreshing()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
//请求数据
extension OpenViewController{
    func requestOpenLotteryData(isShowHud: Bool){
        let alamofire = BJAlamofire()
        alamofire.loadRequestData(url: JAVA_ADMIN, path: JAVA_ADMIN_PATH, action: "300", param: [:]) { (isSuccess, data) in
            self.tableView.mj_header.endRefreshing()
            let arr = JSON(data).arrayObject! as NSArray
            let array = NSMutableArray()
            for dict in arr as! [NSDictionary]{
                let model = OpenModel.init(dict: dict)
                array.add(model)
            }
            self.openArray = array
            self.tableView.reloadData()
        }
        
    }
}
extension OpenViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return openArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = openArray[indexPath.row] as! OpenModel
        
        let lottId = Int( model.lottID)
        if lottId == LOTTERY_TYPE_ID_SF || lottId == LOTTERY_TYPE_ID_RX9{
            let sfcCell = tableView.dequeueReusableCell(withIdentifier: "OpenSFCLotteryCell") as! OpenSFCLotteryCell
            sfcCell.fillData(model: model)
            return sfcCell
        }else if lottId == LOTTERY_TYPE_ID_JCZQ || lottId == LOTTERY_TYPE_ID_JCLQ{
           let ballCell =  tableView.dequeueReusableCell(withIdentifier: "OpenBallLotteryCell") as! OpenBallLotteryCell
            ballCell.fillData(model: model)
            return ballCell
            
        }else{
            let numLotteryCell = tableView.dequeueReusableCell(withIdentifier: "OpenNumLotteryCell") as! OpenNumLotteryCell
            numLotteryCell.fillData(lotteryModel: model)
             return numLotteryCell
        }
    }
}

extension OpenViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
}
