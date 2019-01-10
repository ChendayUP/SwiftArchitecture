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
//  SingleModel
//
//  Created by iCocos on 2019/01/03.
//  Copyright © 2019年 iCocos. All rights reserved.
//
// @class SingleModel.swift
// @abstract 单品模型服务
// @discussion 用户单品模型存储于配置
//
//░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// **************************************************************

import Foundation

/// 单品模型
class SingleModel: SQLiteModel {
    var name:String!
    var price:NSNumber!
    var desc:String?
    var publish_date:NSDate?
    
    /// 数据库模型初始化
    required init() {
        SQLiteConfig.logLevel = .debug
        SQLiteConfig.setDefaultDB(path: getSQLiteDBPath()!, name: SingleModelName)
    }
}

