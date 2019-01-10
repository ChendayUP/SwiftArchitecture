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
//  Double+AppTools
//
//  Created by iCocos on 2018/12/29.
//  Copyright © 2018年 iCocos. All rights reserved.
//
// @class Double+AppTools.swift
// @abstract 浮点工具
// @discussion 实现浮点数的基本操作和服务
//
//░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// **************************************************************

import Foundation

extension Double {
    public var rat: DoubleExtension {
        return DoubleExtension(double: self)
    }
}

public struct DoubleExtension {
    private var double: Double
    fileprivate init(double: Double) {
        self.double = double
    }

    //  MARK: Angle transform
    /// 角度转化为弧度
    public var radian: Double {
        return (Double.pi * double) / 180.0
    }

    /// 弧度转化为角度
    public var angle: Double {
        return (180.0 * double) / Double.pi
    }

    //  MARK: Formatted Output
    /// 格式化输出
    ///
    /// - Parameter fmt: 以字符串形式表示的输出格式
    /// - Returns: 格式化输出结果
    public func format(_ fmt: String) -> String {
        return String(format: "%\(fmt)f", double)
    }
}
