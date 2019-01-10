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
//  APIError
//
//  Created by iCocos on 2018/12/25.
//  Copyright © 2018年 iCocos. All rights reserved.
//
// @class APIError.swift
// @abstract Api错误状态
// @discussion 获取和返回请求error详细信息
//
//░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// **************************************************************

import Foundation

/// APi错误分类枚举
///
/// - SingleRequestFailed//网络请求失败:
/// - SingleNoDataOrDataParsingFailed//无返回数据或数据解析失败:
/// - SingleOperationFailure//操作失败:
/// - SingleLogout//登出:
/// - SingleFailed//失败:
/// - SingleFailedNormal//普通失败:
public enum APIError: Swift.Error {
    
    case SingleRequestFailed(error: Error?) //网络请求失败
    case SingleNoDataOrDataParsingFailed(error: Error?) //无返回数据或数据解析失败
    case SingleOperationFailure(resultCode: Int?, resultMsg: String?) //操作失败
    case SingleLogout //登出
    case SingleFailed(error: Error?) // 失败
    case SingleFailedNormal(error: String?) //普通失败
    
}

// MARK: - 输出error详细信息
extension APIError: LocalizedError {
    
    /// 错误描述
    public var errorDescription: String? {
        switch self {
        case .SingleRequestFailed(let error):
            return "========>>> 网络请求失败: \(String(describing: error)) <<<========"
        case .SingleNoDataOrDataParsingFailed(let error):
            return "========>>> 无返回数据或数据解析失败: \(String(describing: error)) <<<========"
        case .SingleOperationFailure(let resultCode, let resultMsg):
            guard let resultCode = resultCode,
                let resultMsg = resultMsg else {
                    return "========>>> 操作失败 <<<========"
            }
            return "========>>> 错误码: " + String(describing: resultCode) + ", 错误信息: " + resultMsg + " <<<========"
        case .SingleLogout:
            // FIXME: - =======进行登出操作======
            return "========>>> 登录过期,需登出 <<<========"
        case .SingleFailed(let error):
            return "========>>> 失败: \(String(describing: error)) <<<========"
        case .SingleFailedNormal(let error):
            return "========>>> \(String(describing: error)) <<<========"
        }
    }
    
}
