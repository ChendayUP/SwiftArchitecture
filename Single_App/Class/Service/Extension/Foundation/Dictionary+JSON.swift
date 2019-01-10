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
//  Dictionary+JSON
//
//  Created by iCocos on 2019/01/07.
//  Copyright © 2019年 iCocos. All rights reserved.
//
// @class Dictionary+JSON.swift
// @abstract Dictionary拓展
// @discussion 实现Dictionary分类拓展操作
//
//░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// **************************************************************

import UIKit

extension Dictionary {
    
    /// Dictionary 转 JSON 字符串
    ///
    /// - Returns: JSON 字符串
    func toJsonString() -> String {
        var json = ""
        do {
            let data = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            json = String(data: data, encoding: .utf8)!
        } catch {
            print("Json转换失败")
        }
        return json
    }
}
