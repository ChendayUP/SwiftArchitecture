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
//  UIApplication+Extension
//
//  Created by iCocos on 2018/12/21.
//  Copyright © 2018年 iCocos. All rights reserved.
//
// @class UIApplication+Extension.swift
// @abstract Application拓展
// @discussion Application功能与服务拓展
//
//░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// **************************************************************

import UIKit

// MARK: - Application拓展分类
extension UIApplication {
    
    /// 打开Url
    ///
    /// - Parameters:
    ///   - url: url地址
    ///   - completion: 完成回调
    func open(withUrl url: String, completionHandler completion:@escaping((Bool) -> Void)) -> Void {
        if #available(iOS 10.0, *) {
            self.open(URL.init(string: url)!, options: [:], completionHandler: { (successed) in
                completion(successed)
            })
        } else {
            completion(self.openURL(URL.init(string: url)!))
        }
    }
    
}
