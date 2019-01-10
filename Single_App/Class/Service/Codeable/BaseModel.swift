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
//  SwiftImport.swift
//
//  Created by iCocos on 2019/01/03.
//  Copyright © 2019年 iCocos. All rights reserved.
//
// @class SwiftImport.swift
// @abstract 基础模型拓展
// @discussion 实现基本的基础模型操作与服务
//
//░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// **************************************************************

// ******************************Core********************************

import Foundation
import UIKit

public protocol BaseModel: Codable, CustomStringConvertible {
    
}

extension BaseModel {
    // 调用此属性可用与比较两个model是否一致
    public var description:String {
        let mir = Mirror(reflecting: self)
        var des = "[\(mir.subjectType)] {\n"
        for case let (label?, value) in mir.children {
            des += "\(label): \(value)\n"
        }
        des += "\n}"
        return des
    }
}
