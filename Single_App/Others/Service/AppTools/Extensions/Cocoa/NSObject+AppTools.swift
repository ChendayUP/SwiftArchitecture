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
//  NSObject+AppTools
//
//  Created by iCocos on 2018/12/29.
//  Copyright © 2018年 iCocos. All rights reserved.
//
// @class NSObject+AppTools.swift
// @abstract OC对象工具
// @discussion 实现OC基本的Json数据操作
//
//░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// **************************************************************

import Foundation

extension AppTools where Base: NSObject {
    /// Object 对应的 JSON 字符串
    public var jsonString: String? {
        do {
            let data = try JSONSerialization.data(withJSONObject: base, options: .prettyPrinted)
            return String(data: data, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("AppTools NSObject to JSON string Error:\n", error)
            return nil
        }
    }
}
