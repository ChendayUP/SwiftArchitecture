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
//  TiledMapAnnotation
//
//  Created by iCocos on 2019/01/01.
//  Copyright © 2019年 iCocos. All rights reserved.
//
// @class TiledMapAnnotation.swift
// @abstract 碎片地图标注View
// @discussion 实现和显示碎片地图标注
//
//░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// **************************************************************

import UIKit

/// 大图动画
class TiledMapAnnotation: TiledAnnotation
{
    var isSelectable = false
    var isSelected = false

    /// 碎片地图节点选中
    ///
    /// - Parameter isSelectable: 是否选中
    init(isSelectable: Bool)
    {
        super.init()

        self.isSelectable = isSelectable
    }
}
