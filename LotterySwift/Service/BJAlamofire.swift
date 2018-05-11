//
//  BJAlamofire.swift
//  LotterySwift
//
//  Created by richard on 2018/4/18.
//  Copyright © 2018年 richard. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CryptoSwift
class BJAlamofire: NSObject {
    
  
    var params: NSDictionary!
    var action: String!
    
    func loadRequestData(url: String, path: String,action: String, param: NSDictionary?, finshedBlock: @escaping((_ success: Bool, _ data: Any) -> ())){
        
        let urlStr = url + path
        var parameter = [String: String]()
        self.action = action
        self.params = param
        parameter["request"] =  encryptionParams()
        
        let url = URL(string: urlStr)
        Alamofire.request(url!, method: .post, parameters: parameter).responseJSON { (response) in
            
            guard response.result.isSuccess else {
                finshedBlock(false, "请求失败")
                return
            }
            
            if let value = response.result.value{
            let json = JSON(value)
                
                
            let dataDict = json["data"].object
            finshedBlock(true, dataDict)
            }
        }
    }
}


extension BJAlamofire{
    
     func encryptionParams() -> String{
        
        let dictionary = NSMutableDictionary()
        dictionary.setValue("7236AEA2CC344A7390BC89126B7D23CB", forKey: "uuid")
        dictionary.setValue("IPHONE", forKey: "platformCode")
        dictionary.setValue(UIDevice.current.systemVersion, forKey: "platformVersion")
         var appVersion: String = ""
        if let info = Bundle.main.infoDictionary{
             appVersion = info["CFBundleShortVersionString"] as? String ?? "Unknown"
        }
        dictionary.setValue(appVersion, forKey: "appVersion")
        dictionary.setValue("", forKey: "UserID")
        dictionary.setValue("1", forKey: "cmdId")
        dictionary.setValue("app_zz_ios", forKey: "cmdName")
        dictionary.setValue("", forKey: "token")
        dictionary.setValue(0, forKey: "usertype")
        dictionary.setValue(self.action, forKey: "action")
        
        dictionary.setValue(UIDevice.current.machineModelName, forKey: "phoneName")
        dictionary.setValue("", forKey: "ts")
        dictionary.setValue("", forKey: "userGuid")
        dictionary.setValue("", forKey: "traceID")
        
        let bodyDict = NSMutableDictionary()
        bodyDict.setDictionary(self.params as! [AnyHashable : Any])
        
        var dict = [String: NSDictionary]()
        dict["body"] = bodyDict
        dict["header"] = dictionary
        
        let data = try! JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
        
       
        var result = ""
        do {
            let str: String = String(data: data, encoding: String.Encoding.utf8)!
            let key = "d3YmI1BUOSE2S2YmalBVZUQ="
            let iv = "0000000000000000"
            
            //使用AES-128-CBC加密模式
            let aes = try AES(key: key.bytes, blockMode: .CBC(iv: iv.bytes))
            
            //开始加密
            let encrypted = try aes.encrypt(str.bytes)
            result = encrypted.toBase64()!
            
            //开始解密
//            let decrypted =  try aes.decrypt(encrypted)
        } catch {
        }
        
        let encryped: String = result
        
        return encryped
    }
}
