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
//  MethodInfo
//
//  Created by iCocos on 2018/12/24.
//  Copyright © 2018年 iCocos. All rights reserved.
//
// @class MethodInfo.swift
// @abstract 方法信息
// @discussion 实现方法信息输出
//
//░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// **************************************************************

import Foundation

public struct MethodInfo {
    /// 在控制台输出方法信息
    ///
    /// - Parameters:
    ///   - message: 原样显示在控制台的信息
    ///   - file: 文件名
    ///   - method: 方法名
    ///   - line: 代码行数
    public static func methodLog<T>(_ message: T,
                                    file:   String = #file,
                                    method: String = #function,
                                    line:   Int    = #line)
    {
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    }
}
