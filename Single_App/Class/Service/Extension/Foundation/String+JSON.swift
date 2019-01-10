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
//  String+JSON
//
//  Created by iCocos on 2019/01/07.
//  Copyright © 2019年 iCocos. All rights reserved.
//
// @class String+JSON.swift
// @abstract String拓展
// @discussion 实现String分类拓展操作
//
//░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// **************************************************************

import UIKit

extension String {
    
    
    /// JSON 字符串 转 JSON 对象
    ///
    /// - Returns: JSON对象
    func toObject() -> Any? {
        
        var object:Any? = nil
        
        let data = self.data(using: .utf8)
        do {
            object = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
        } catch {
            print("JSON 转换失败")
        }
        
        return object
    }
}
