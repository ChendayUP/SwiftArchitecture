////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
//                          _ooOoo_                               //
//                         o8888888o                              //
//                         88" . "88                              //
//                         (| ^_^ |)                              //
//                         O\  =  /O                              //
//                      ____/`---'\____                           //
//                    .'  \\|     |//  `.                         //
//                   /  \\|||  :  |||//  \                        //
//                  /  _||||| -:- |||||-  \                       //
//                  |   | \\\  -  /// |   |                       //
//                  | \_|  ''\---/''  |   |                       //
//                  \  .-\__  `-`  ___/-. /                       //
//                ___`. .'  /--.--\  `. . ___                     //
//              ."" '<  `.___\_<|>_/___.'  >'"".                  //
//            | | :  `- \`.;`\ _ /`;.`/ - ` : | |                 //
//            \  \ `-.   \_ __\ /__ _/   .-` /  /                 //
//      ========`-.____`-.___\_____/___.-`____.-'========         //
//                           `=---='                              //
//      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        //
//             佛祖保佑       永无BUG     永不修改                  //
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
//                           iCocos                               //
////////////////////////////////////////////////////////////////////
//                    http://www.icocos.cn                        //
////////////////////////////////////////////////////////////////////
//                  https://icocos.github.io                      //
////////////////////////////////////////////////////////////////////
//                 http://al1020119.github.io/                    //
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
//                                                                //
//                          程序员之歌                             //
//                                                                //
//                 十年生死两茫茫，写程序，到天亮。                  //
//                     千行代码，Bug何处藏。                        //
//                 纵使上线又怎样，朝令改，夕断肠。                  //
//                                                                //
//                 领导每天新想法，天天改，日日忙。                  //
//                     相顾无言，惟有泪千行。                       //
//                 每晚灯火阑珊处，夜难寐，加班狂。                  //
////////////////////////////////////////////////////////////////////
/*******************************************************************
 *                                                                 *
 *       .=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-.        *
 *       |                     ______                     |        *
 *       |                  .-"      "-.                  |        *
 *       |                 /            \                 |        *
 *       |     _          |              |          _     |        *
 *       |    ( \         |,  .-.  .-.  ,|         / )    |        *
 *       |     > "=._     | )(__/  \__)( |     _.=" <     |        *
 *       |    (_/"=._"=._ |/     /\     \| _.="_.="\_)    |        *
 *       |           "=._"(_     ^^     _)"_.="           |        *
 *       |               "=\__|IIIIII|__/="               |        *
 *       |              _.="| \IIIIII/ |"=._              |        *
 *       |    _     _.="_.="\          /"=._"=._     _    |        *
 *       |   ( \_.="_.="     `--------`     "=._"=._/ )   |        *
 *       |    > _.="                            "=._ <    |        *
 *       |   (_/                                    \_)   |        *
 *       |                                                |        *
 *       '-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-='        *
 *                                                                 *
 *           LASCIATE OGNI SPERANZA, VOI CH'ENTRATE                *
 ******************************************************************/
/////////////////////////////////////////////////////////////////////
//                                                                 //
//                       .::::.                                    //
//                     .::::::::.                                  //
//                    :::::::::::                                  //
//                 ..:::::::::::'                                  //
//              '::::::::::::'                                     //
//                .::::::::::                                      //
//           '::::::::::::::..                                     //
//                ..::::::::::::.                                  //
//              ``::::::::::::::::                                 //
//               ::::``:::::::::'        .:::.                     //
//              ::::'   ':::::'       .::::::::.                   //
//            .::::'      ::::     .:::::::'::::.                  //
//           .:::'       :::::  .:::::::::' ':::::.                //
//          .::'        :::::.:::::::::'      ':::::.              //
//         .::'         ::::::::::::::'         ``::::.            //
//     ...:::           ::::::::::::'              ``::.           //
//    ```` ':.          ':::::::::'                  ::::..        //
//                       '.:::::'                    ':'````..     //
/////////////////////////////////////////////////////////////////////
/********************************************************************
 *                                                                  *
 *   ┌───┐   ┌───┬───┬───┬───┐ ┌───┬───┬───┬───┐ ┌───┬───┬───┬───┐  *
 *   │Esc│   │ F1│ F2│ F3│ F4│ │ F5│ F6│ F7│ F8│ │ F9│F10│F11│F12│  *
 *   └───┘   └───┴───┴───┴───┘ └───┴───┴───┴───┘ └───┴───┴───┴───┘  *
 *   ┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───────┐  *
 *   │~ `│! 1│@ 2│# 3│$ 4│% 5│^ 6│& 7│* 8│( 9│) 0│_ -│+ =│ BacSp │  *
 *   ├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─────┤  *
 *   │ Tab │ Q │ W │ E │ R │ T │ Y │ U │ I │ O │ P │{ [│} ]│ | \ │  *
 *   ├─────┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴─────┤  *
 *   │ Caps │ A │ S │ D │ F │ G │ H │ J │ K │ L │: ;│" '│ Enter  │  *
 *   ├──────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────────┤  *
 *   │ Shift  │ Z │ X │ C │ V │ B │ N │ M │< ,│> .│? /│  Shift   │  *
 *   ├─────┬──┴─┬─┴──┬┴───┴───┴───┴───┴───┴──┬┴───┼───┴┬────┬────┤  *
 *   │ Ctrl│    │Alt │         Space         │ Alt│    │    │Ctrl│  *
 *   └─────┴────┴────┴───────────────────────┴────┴────┴────┴────┘  *
 *                                                                  *
 ********************************************************************
 ********************************************************************
 *                                                                  *
 *                                                                  *
 *                            iCocos                                *
 *                                                                  *
 *                       http://www.icocos.cn                       *
 *                                                                  *
 *                     https://icocos.github.io                     *
 *                                                                  *
 *                    http://al1020119.github.io/                   *
 *                                                                  *
 *                                                                  *
 ********************************************************************
 ********************************************************************
 ********************************************************************/
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
//  <#类名#>
//
//  Created by iCocos on 2019/01/06.
//  Copyright © 2019年 iCocos. All rights reserved.
//
// @class <#类名#>.swift
// @abstract <#类的描述#>
// @discussion <#类的功能#>
//
//░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// **************************************************************

import UIKit

/// Main->
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    /// 启动配置
    ///
    /// - Parameters:
    ///   - application: UIApplication
    ///   - launchOptions: 启动选项
    /// - Returns: Bool
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        /* 总结：
         1：1：window为可选类型，可选类型的定义：var window: UIWindow?，可选类型就是可以为空值nil或是有值，若是想获得可选类型的值，则可以进行可选绑定或是强制解包，若是强制解包必须要保证强制解包的值不为nil，若为nil会产生崩溃，一般可选绑定用guard else进行校验（let会自动解包） 2：var window: UIWindow?，为该类的属性，定义属性的时候，必须保证属性有初始化值，或是定义成可选类型，否则会报错
         2：需要自己去创建window：创建对象就用构造函数：RHTabBarViewController()，获得实例对象之后，调用方法可以使用点语法window?.makeKeyAndVisible()
         window = UIWindow(frame:UIScreen.main.bounds)
         window?.rootViewController = RHTabBarViewController()
         window?.makeKeyAndVisible()
         
         3：设置全局tabBar的样式：设置tabBar的tintColor，就是改变tabbarItem的图片文字颜色，若不设置，则系统会自动将图片和文字渲染为蓝色：UITabBar.appearance().tintColor = UIColor.orange
         4：设置全局的函数，或是全局的样式，都在AppDelegate文件中去设置
         */
         //MARK:-1：创建window
         let guide = SwiftGuideViewController()
         window = UIWindow(frame:UIScreen.main.bounds)
         window?.rootViewController = guide
         window?.makeKeyAndVisible()
         //MARK:-2:设置全局tabbar的样式
         //UITabBar.appearance().tintColor = UIColor.orange
         return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

