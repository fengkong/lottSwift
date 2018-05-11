//
//  BJWebViewController.swift
//  LotterySwift
//
//  Created by 孔峰 on 2018/5/9.
//  Copyright © 2018年 孔峰. All rights reserved.
//

import UIKit

class BJWebViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    
    var webUrlStr: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.delegate = self
        if webUrlStr.count > 0 {
            let url = URL(string: webUrlStr)
            let request = URLRequest(url: url!)
            self.webView.loadRequest(request as URLRequest)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension BJWebViewController: UIWebViewDelegate{
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print(error)
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print(111)
    }
    func webViewDidStartLoad(_ webView: UIWebView) {
        print(222)
    }
}
