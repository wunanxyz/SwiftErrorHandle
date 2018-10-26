//
//  ViewController.swift
//  tryCatchDemo
//
//  Created by 吴楠 on 2018/10/25.
//  Copyright © 2018 wunan. All rights reserved.
//

import UIKit

enum ErrorType:Error{
    case ErrorTypeNil
    case ErrorType1
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        notPrintError()
        oneCondition()
        twoCondition()
    }

    func largerThanEighteenthFunc(a:Int16?) throws {
        if let need = a ,need >= 18{
            print("need >>>> \(need)")
            throw  ErrorType.ErrorTypeNil
        }else{
            print("need <=18")
            throw  ErrorType.ErrorType1
        }
    }
    func notPrintError() {
        //不需要捕抓错误，可以使用try!或try?
        //不建议使用try!，使用try?会更加安全。因为如果当有错误捕抓到时，程序会直接崩溃
        try? largerThanEighteenthFunc(a: nil)
    }
   
    func oneCondition() { //如果只包含一个catch语句，那么所有的错误都会在这个catch中执行，能够捕抓其错误信息
        do {
            try largerThanEighteenthFunc(a: 9)
        } catch let error {
            print("error >>> \(error)")
        }
    }
    
    func twoCondition() {// 在使用catch时，它是能够进行模式匹配的，我们能够进行更精准的错误匹配处理
        do {
            try largerThanEighteenthFunc(a: 20)
        } catch ErrorType.ErrorTypeNil {
            print(ErrorType.ErrorTypeNil)
        } catch ErrorType.ErrorType1 {
            print(ErrorType.ErrorType1)
        } catch { // 加入一个空的catch，用于关闭catch。否则会报错：Errors thrown from here are not handled because the enclosing catch is not exhaustive
        }
    }
}

