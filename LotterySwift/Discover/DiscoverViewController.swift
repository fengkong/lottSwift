//
//  DiscoverViewController.swift
//  LotterySwift
//
//  Created by richard on 2018/4/23.
//  Copyright © 2018年 richard. All rights reserved.
//

import UIKit
import SwiftyJSON

class DiscoverViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var tableData = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "发现"
        
        tableView.register(UINib.init(nibName: "DiscoverMainCell", bundle: nil), forCellReuseIdentifier: "DiscoverMainCell")
        tableView.mj_header = RefreshHeader(refreshingBlock: { [weak self] in
            self?.requestData()
        })
        tableView.mj_header.beginRefreshing()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension DiscoverViewController{
    func requestData() {
        let alamofire = BJAlamofire()
        alamofire.loadRequestData(url: JAVA_ADMIN, path: JAVA_ADMIN_PATH, action: "9032", param: [:]) { (isSuccess, data) in
            self.tableView.mj_header.endRefreshing()
            let arr = JSON(data).arrayObject! as NSArray
            
            let array = NSMutableArray()
            for dict in arr as! [NSDictionary]{
                let model = DiscoverModel.deserialize(from: dict)
                array.add(model!)
            }
            self.tableData = array
            self.tableView.reloadData()
        }
    }
}


extension DiscoverViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let discoverCell = tableView.dequeueReusableCell(withIdentifier: "DiscoverMainCell") as! DiscoverMainCell
        let model = tableData[indexPath.row] as! DiscoverModel
        discoverCell.fillData(model: model)
        return discoverCell
    }
}

extension DiscoverViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webView = BJWebViewController()
        let model = tableData[indexPath.row] as! DiscoverModel
        webView.webUrlStr = model.param
        navigationController?.pushViewController(webView, animated: true)
    }
}
