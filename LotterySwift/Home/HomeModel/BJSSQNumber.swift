//
//  BJSSQNumber.swift
//  LotterySwift
//
//  Created by 孔峰 on 2018/4/28.
//  Copyright © 2018年 孔峰. All rights reserved.
//

import UIKit

class BJSSQNumber: NSObject {

    var redBalls = NSMutableArray()
    var blueBalls = NSMutableArray()
    
    var d_redBalls = NSMutableArray()
    var t_redballs = NSMutableArray()
    var t_blueBalls = NSMutableArray()
    
    var ssqPlayType: Int!
    var noteAmount: Int!
    
    var lotteryNumberParam = NSMutableDictionary()
    
    var tag: Int!
    
    
    
    
    
}



extension BJSSQNumber {
    
    func generateBallNumber(count: Int, number: Int) -> [NSNumber]{
        var array = [NSNumber]()
        
        for _ in 0..<count {
            var redo: Bool = false
            var randomNumber: Int = 0
            
            repeat{
                redo = false
                randomNumber = Int(arc4random() % UInt32(number)) + 1
                for number in array{
                    if Int(truncating: number) == randomNumber{
                        redo = true
                    }
                }
                
            } while redo
            
            array.append(NSNumber(integerLiteral: randomNumber))
        }
        
        
        let sort: NSArray = array as NSArray
        
        let sortedArray = sort.sortedArray { (obj1, obj2) -> ComparisonResult in
            
            let num1 = obj1 as! NSNumber
            let num2 = obj2 as! NSNumber
            
            if Int(truncating: num1) > Int(truncating: num2){
                return ComparisonResult.orderedDescending
            }
            if Int(truncating: num1) < Int(truncating: num2){
                return ComparisonResult.orderedAscending
            }
            
            return ComparisonResult.orderedSame
        }
        
        return sortedArray as! [NSNumber]
    }
}

