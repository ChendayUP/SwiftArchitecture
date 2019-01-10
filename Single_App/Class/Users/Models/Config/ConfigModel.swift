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
//  ConfigModel
//
//  Created by iCocos on 2019/01/03.
//  Copyright © 2019年 iCocos. All rights reserved.
//
// @class ConfigModel.swift
// @abstract 配置模型服务
// @discussion 用户配置模型存储于配置
//
//░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// **************************************************************

import UIKit

/// 配置模型
class ConfigModel: SQLiteModel {
    var name:String!
    var price:NSNumber!
    var desc:String?
    var publish_date:NSDate?
    
    /// 数据库模型初始化
    required init() {
        SQLiteConfig.logLevel = .debug
        SQLiteConfig.setDefaultDB(path: getSQLiteDBPath()!, name: ConfigModelName)
    }
}
