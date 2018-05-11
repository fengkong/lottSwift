//
//  BJDaletouNumber.swift
//  LotterySwift
//
//  Created by richard on 2018/4/27.
//  Copyright © 2018年 richard. All rights reserved.
//

import UIKit

class BJDaletouNumber: NSObject {

    var headBallArray = NSMutableArray()
    var backBallArray = NSMutableArray()
    
    var d_redBalls = NSMutableArray()
    var t_redballs = NSMutableArray()
    var d_blueBalls = NSMutableArray()
    var t_blueBalls = NSMutableArray()
    
    var dltPlayType: Int!
    
    var  descriptionString: NSAttributedString!
    
    var noteAmount: Int!
    
    var tag: Int!
    
    
    override func copy() -> Any {
        let daletouNumber = BJDaletouNumber()
        daletouNumber.headBallArray = headBallArray.mutableCopy() as! NSMutableArray
        daletouNumber.backBallArray = backBallArray.mutableCopy() as! NSMutableArray
        daletouNumber.d_redBalls = d_redBalls.mutableCopy() as! NSMutableArray
        daletouNumber.t_redballs = t_redballs.mutableCopy() as! NSMutableArray
        daletouNumber.d_blueBalls = d_blueBalls.mutableCopy() as! NSMutableArray
        daletouNumber.t_blueBalls = t_blueBalls.mutableCopy() as! NSMutableArray
        daletouNumber.tag = tag
        return daletouNumber
    }
    
    func clear(){
        headBallArray.removeAllObjects()
        backBallArray.removeAllObjects()
        d_redBalls.removeAllObjects()
        t_redballs.removeAllObjects()
        d_blueBalls.removeAllObjects()
        t_blueBalls.removeAllObjects()
    }
}

extension BJDaletouNumber{
    
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
