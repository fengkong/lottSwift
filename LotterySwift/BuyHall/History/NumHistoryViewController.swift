//
//  NumHistoryViewController.swift
//  LotterySwift
//
//  Created by 孔峰 on 2018/5/2.
//  Copyright © 2018年 孔峰. All rights reserved.
//

import UIKit

class NumHistoryViewController: UIViewController {
    
    var data: NSArray!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var contentTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        contentTableView.register(UINib.init(nibName: "NumHistoryTableCell", bundle: nil), forCellReuseIdentifier: "NumHistoryTableCell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if event?.type == UIEventType.touches {
            let touch : UITouch = touches.first!
            let point: CGPoint = touch.location(in: self.contentView)
            if point.y < 0 {
                dismissAction(UIButton())
            }
        }
    }
    
    
    @IBAction func dismissAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}


extension NumHistoryViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let historyCell = contentTableView.dequeueReusableCell(withIdentifier: "NumHistoryTableCell") as! NumHistoryTableCell
        let dict = data[indexPath.row] as! NSDictionary
        historyCell.fillData(dict: dict)
        return historyCell
    }
    
    
}
