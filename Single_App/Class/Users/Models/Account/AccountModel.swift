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
//  AccountModel
//
//  Created by iCocos on 2019/01/03.
//  Copyright © 2019年 iCocos. All rights reserved.
//
// @class AccountModel.swift
// @abstract 账号模型
// @discussion 定义和存储用户模型
//
//░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// **************************************************************

import UIKit
import SwiftyUserDefaults

/// 账号模型
class AccountModel: SQLiteModel {
    var name:String!
    var price:NSNumber!
    var desc:String?
    var publish_date:NSDate?
    required init() {
        SQLiteConfig.logLevel = .debug
        SQLiteConfig.setDefaultDB(path: getSQLiteDBPath()!, name: AccountModelName)
    }
}

// MARK: - 用户配置模型Key
extension DefaultsKeys {
    static let uid = DefaultsKey<String?>("uid")
    static let username = DefaultsKey<String?>("username")
}
