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
//  View+Extension
//
//  Created by iCocos on 2019/01/05.
//  Copyright © 2019年 iCocos. All rights reserved.
//
// @class View+Extension.swift
// @abstract View拓展
// @discussion 实现View的相关拓展操作
//
//░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// **************************************************************

import UIKit

@objc extension UIView {

    // MARK: - 处理所有事件
    public func handleActions() -> () {

    }

    // MARK: - 添加UI
    public func setupUI() -> () {

    }

    // MARK: - 获取view 的控制器
    public func viewController() -> UIViewController? {

        var next = self.next
        while next != nil {
            if (next?.isKind(of: UIViewController.superclass()!))! {
                return next as? UIViewController
            }
            next = next?.next
        }
        return nil
    }

}
