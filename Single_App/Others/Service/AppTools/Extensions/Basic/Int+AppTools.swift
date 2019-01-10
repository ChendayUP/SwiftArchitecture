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
//  Int+AppTools
//
//  Created by iCocos on 2018/12/29.
//  Copyright © 2018年 iCocos. All rights reserved.
//
// @class Int+AppTools.swift
// @abstract 整形工具
// @discussion 实现基本的整形数据操作
//
//░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// **************************************************************

import UIKit

extension Int {
    public var rat: IntExtension {
        return IntExtension(int: self)
    }
}

public struct IntExtension {
    private var int: Int

    fileprivate init(int: Int) {
        self.int = int
    }

    //  MARK: Farmatted Output
    /// 格式化输出
    ///
    /// - Parameter fmt: 以字符串形式表示的输出格式
    /// - Returns: 格式化输出结果
    public func format(_ fmt: String) -> String {
        return String(format: "%\(fmt)d", int)
    }

    //  MARK: Transfer
    /// 转换为对应的 CGFloat 值
    public var cgFloatValue: CGFloat {
        return CGFloat(int)
    }
}
