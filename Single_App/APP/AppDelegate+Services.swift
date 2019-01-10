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
//  AppDelegate+Services
//
//  Created by iCocos on 2018/12/21.
//  Copyright © 2018年 iCocos. All rights reserved.
//
// @class AppDelegate+Services.swift
// @abstract App服务
// @discussion AppDelegate启动与配置服务相关
//
//░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// **************************************************************

import Toast_Swift

private let appID       = ""
private let clientKey   = ""

// MARK: - 全局代理
extension AppDelegate {
    
    /// 注册服务
    ///
    /// - Parameter launchOptions: 启动选项
    func registerServices(_ launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        ToastManager.shared.style.activitySize = CGSize(width: 88, height: 88)
    }
    
}
