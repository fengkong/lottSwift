//
//  BJScoreViewController.swift
//  LotterySwift
//
//  Created by richard on 2018/5/11.
//  Copyright © 2018年 孔峰. All rights reserved.
//

import UIKit

class BJScoreViewController: UIViewController {

    @IBOutlet weak var scoreHeadView: UIView!
    @IBOutlet weak var scoreTableView: UITableView!
    
    
    lazy var navigationSegmentControl: UISegmentedControl = {
        let navigationSegmentControl = UISegmentedControl(items: ["足球", "篮球"])
        navigationSegmentControl.frame = CGRect(x: 0.0, y: 0.0, width: 150, height: 27)
        navigationSegmentControl.tintColor = UIColor.white
        navigationSegmentControl.selectedSegmentIndex = 0
        navigationSegmentControl.addTarget(self, action: #selector(navigationSegmentControlValueChanged(_:)), for: UIControlEvents.valueChanged)
        return navigationSegmentControl
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBackItem()
        
        navigationItem.titleView = navigationSegmentControl
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension BJScoreViewController{
    @objc func navigationSegmentControlValueChanged(_ sender: UISegmentedControl){
        
    }
}
