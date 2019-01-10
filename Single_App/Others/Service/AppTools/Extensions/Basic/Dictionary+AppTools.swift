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
//  Dictionary+AppTools
//
//  Created by iCocos on 2018/12/29.
//  Copyright © 2018年 iCocos. All rights reserved.
//
// @class Dictionary+AppTools.swift
// @abstract 字典工具
// @discussion 实现基本的字典检查操作
//
//░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// **************************************************************

import Foundation

extension Dictionary {
    /// 检验 Dictionary 中是否存在某个 key
    ///
    /// - Parameter key: 待检验的 key
    /// - Returns: 检验结果的布尔值
    public func rat_has(key: Key) -> Bool {
        for aKey in self.keys {
            if key == aKey {
                return true
            }
        }
        return false
    }
}
