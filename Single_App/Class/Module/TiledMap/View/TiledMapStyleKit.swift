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
//  TiledMapStyleKit
//
//  Created by iCocos on 2019/01/01.
//  Copyright © 2019年 iCocos. All rights reserved.
//
// @class TiledMapStyleKit.swift
// @abstract 碎片地图样式组件
// @discussion 实现和显示碎片地图配置
//
//░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// **************************************************************

import UIKit

/// 碎片地图样式组件
public class TiledMapStyleKit: NSObject
{
    
    /// 主要字体
    class var mainFont: UIFont
    {
        return UIFont(name: "HelveticaNeue-Bold", size: 14)!
    }

    //// Cache
    private struct Cache
    {
        static var imageDict: [String:UIImage] = Dictionary()
        //static var oneTargets: [AnyObject]?
    }

    //// Drawing Methods
    public class func draw(string: String)
    {
        //// General Declarations
        guard let context = UIGraphicsGetCurrentContext() else { return }

        //// Text Drawing
        let textRect = CGRect(x: 0, y: 0, width: 25, height: 25)
        let textTextContent = NSString(string: string)
        let textStyle = NSMutableParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        textStyle.alignment = NSTextAlignment.center

        let textFontAttributes = [NSAttributedString.Key.font: TiledMapStyleKit.mainFont, NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.paragraphStyle: textStyle]

        let textTextHeight: CGFloat = textTextContent.boundingRect(with: CGSize(width: textRect.width, height: CGFloat.infinity), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: textFontAttributes, context: nil).size.height
        context.saveGState()
      
        context.clip(to: textRect)
        textTextContent.draw(in: CGRect(x: textRect.minX, y: textRect.minY + (textRect.height - textTextHeight) / 2, width: textRect.width, height: textTextHeight), withAttributes: textFontAttributes)
        context.restoreGState()
    }

    //// Generated Images
    ///
    /// - Parameter string: 图片字符串
    /// - Returns: 图片实体
    public class func image(string: String) -> UIImage
    {
        if let image = Cache.imageDict[string] {
            return image
        }

        UIGraphicsBeginImageContextWithOptions(CGSize(width: 25, height: 25), false, 0)
        TiledMapStyleKit.draw(string: string)

        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        Cache.imageDict[string] = image

        return image
    }
    
}
