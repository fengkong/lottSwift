//
//  DLTViewController.swift
//  LotterySwift
//
//  Created by 孔峰 on 2018/4/28.
//  Copyright © 2018年 孔峰. All rights reserved.
//

import UIKit
import SwiftyJSON

class DLTViewController: UIViewController {
    @IBOutlet weak var numberScrollView: UIScrollView!
    
    @IBOutlet weak var remiainTimeLabel: UILabel!
    @IBOutlet weak var issueCodeLabel: UILabel!
    
    
    var historyArray: NSArray!
    
    lazy var dltAreaView: DLTNumberAreaView = {
        let dltAreaView = DLTNumberAreaView()
        let width: CGFloat = (kScreenWidth - 8.0 * 2 - 6 * 6.0) / 7
        dltAreaView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: width * 7 + 300)
        dltAreaView.lotteryNumber = lotteryNumber
        dltAreaView.delegate = self
        dltAreaView.creatUpUI()
        
        
        return dltAreaView
    }()
  
    
    lazy var lotteryNumber: BJDaletouNumber = {
       let lotteryNumber = BJDaletouNumber()
       return lotteryNumber
    }()
    
    lazy var currentLotteryIssue: BJLotteryIssue = {
        let currentLotteryIssue = BJLotteryIssue()
        currentLotteryIssue.lotteryId = LOTTERY_TYPE_ID_DALETOU
        return currentLotteryIssue
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "超级大乐透"
        configNavigationBackItem()
        
        reloadDLTNumberAreaView()
        
        loadHistoryRequest()
        
        currentLotteryIssue.requestIssueData { (error, data) in
            
            if error.count > 0 {
                
            }else{
                print(data)
                self.issueCodeLabel.text = String(format: "第%@期", self.currentLotteryIssue.issueName)
                var endTimeStr = self.currentLotteryIssue.endTime! as NSString
                if self.currentLotteryIssue.endTime .count >= 16 {
                    let range = NSRange(location: 5, length: 11)
                    endTimeStr = endTimeStr.substring(with: range) as NSString
                }
                
                var awardTimeStr = self.currentLotteryIssue.awardTime! as NSString
                if self.currentLotteryIssue.awardTime.count >= 16 {
                    let range = NSRange(location: 5, length: 11)
                    awardTimeStr = awardTimeStr.substring(with: range) as NSString
                }
                
                self.remiainTimeLabel.text = String(format: "%@截止  %@开奖",  endTimeStr, awardTimeStr)
                
                
                self.reloadDLTNumberAreaView()
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func numberBallHistroyLonneryNum(_ sender: UIButton) {
        
        if !IsEmpty(thing: historyArray) {
           
            let historyController = NumHistoryViewController()
            historyController.data = historyArray
            historyController.modalPresentationStyle = UIModalPresentationStyle.custom
            present(historyController, animated: true) {
                
            }
            
        }
    }
}


extension DLTViewController {
    func loadHistoryRequest(){
        let param = NSMutableDictionary()
        param.setValue("39", forKey: "LottID")
        let alamofire = BJAlamofire()
        alamofire.loadRequestData(url: JAVA_BASE, path: JAVA_BASE_PATH, action: "301", param: param) { (isSuccess ,data) in
            
            let arrar = JSON(data).arrayObject! as NSArray
            self.historyArray = arrar
        }
        
    }
}



extension DLTViewController {
    
    private func reloadDLTNumberAreaView(){
        
        numberScrollView.addSubview(dltAreaView)
    }
}


extension DLTViewController: NumberLotteryViewDelegate{
    
    func numberBallHistoryLotteryNumButton(button: UIButton) {
        
        
    }
    
    func numberBallDidSelect(ballButton: UIButton, error: NSError) {
        if ballButton.isSelected == true {
             UIView.animationView(aView: ballButton, delay: 0)
        }
    }
    
    func upDataScrollView(isShowLeave: Bool, isDanTuoType: Bool) {
        
        
    }
    
    func numberBallSaveData(button: UIButton) {
        
    }
    
    
}
