//
//  ZMTabModel.swift
//  Durian
//
//  Created by 牛新怀 on 2018/7/30.
//  Copyright © 2018年 ZhiMiABC. All rights reserved.
//

import UIKit

class ZMTabModel: NSObject {

    static let tabTitleArray = ["首页",
                                "我的"]
    static let tabViewControllerArray = ["HomeViewController",
                                         "UserController"]
    static let tabNormalImageArray = [ZMTabModel.imageViewWithName(imageNamed: "HomeTabbarImageUnSelect"),
                                      ZMTabModel.imageViewWithName(imageNamed: "MyTabbarImageUnSelect")]
    static let tabSelectImageArray = [ZMTabModel.imageViewWithName(imageNamed: "HomeTabbarImageSelect"),
                                      ZMTabModel.imageViewWithName(imageNamed: "MyTabbarImageSelect")]
    
    
}

extension ZMTabModel {
    
    static func imageViewWithName(imageNamed: String) -> UIImage? {
        let imagePic = UIImage.init(named: imageNamed)
        let image = imagePic?.withRenderingMode(.alwaysOriginal)
        return image
    }
    
    // 封装公共方法
    static func addChildViewControllers(_ className: String, _ tabTitle: String?, tabNormalImage: UIImage, tabSelectImage: UIImage) -> UIViewController {
        let object = NSClassFromString("Durian." + className) as! UIViewController.Type
        let vc = object.init()
        vc.title = tabTitle
        vc.tabBarItem = UITabBarItem.init(title: tabTitle,
                                          image: tabNormalImage,
                                          selectedImage: tabSelectImage)
        if UIDevice.current.userInterfaceIdiom == .phone {
//            vc.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
            vc.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
        }
        return vc
    }
    
}
