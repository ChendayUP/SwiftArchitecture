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
//  UIApplication+Extension.swift
//
//  Created by iCocos on 2018/12/21.
//  Copyright © 2018年 iCocos. All rights reserved.
//
// @class UIApplication+Extension.swift
// @abstract <#类的描述#>
// @discussion <#类的功能#>
//
//░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// **************************************************************

import UIKit
extension UIApplication {
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
