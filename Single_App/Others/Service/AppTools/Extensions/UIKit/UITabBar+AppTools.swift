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
//  UITabBar+AppTools
//
//  Created by iCocos on 2018/12/28.
//  Copyright © 2018年 iCocos. All rights reserved.
//
// @class UITabBar+AppTools.swift
// @abstract tabBar条工具
// @discussion 实现系统的tabBar条主题操作
//
//░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// **************************************************************

import UIKit

extension AppTools where Base: UITabBar {
    /// 修改 Tab Bar 的背景颜色
    ///
    /// - Parameter color: 提供给 Tab Bar 的背景的 tint color
    public static func barTintColor(_ color: UIColor) {
        UITabBar.appearance().barTintColor = color
    }

    /// 修改 Tab Bar item 的 tint color
    ///
    /// - Parameter color: 提供给 Tab Bar item 的 tint color
    public static func tintColor(_ color: UIColor) {
        UITabBar.appearance().tintColor = color
    }
}
