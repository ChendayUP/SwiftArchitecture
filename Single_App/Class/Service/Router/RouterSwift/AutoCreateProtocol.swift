//░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// **************************************************************
//                  http://www.icocos.cn                       //
//                 https://icocos.github.io                    //
//                https://al1020119.github.io                  //
// **************************************************************
//  ************  😂🤔 曹理鹏(梦工厂@iCocos) 🤔😂  ************  //
// **************************************************************
//░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// **************************************************************
//
//  Single_App
//  AutoCreateProtocol
//
//  Created by iCocos on 2018/12/23.
//  Copyright © 2018年 iCocos. All rights reserved.
//
// @class AutoCreateProtocol.swift
// @abstract 自动协议创建
// @discussion 实现控制器协议的自动化
//
//░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// **************************************************************

import UIKit

protocol AutoCreateProtocol {
    init(params: Dictionary<String, Any?>)
}
extension AutoCreateProtocol {

}
extension AutoCreateProtocol where Self: RouterBaseController {
    // 创建并且复制参数
    //func createInitParameter() {
    //    self.parameter = ["nickName":"Alexluan"]
    //    print(#function)
    //}
}
