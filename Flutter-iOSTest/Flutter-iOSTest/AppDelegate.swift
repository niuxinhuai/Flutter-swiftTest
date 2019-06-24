//
//  AppDelegate.swift
//  Flutter-iOSTest
//
//  Created by 牛新怀 on 2019/5/22.
//  Copyright © 2019 牛新怀. All rights reserved.
//

import UIKit
import Flutter
import FlutterPluginRegistrant


//@UIApplicationMain
//@objc class AppDelegate: FlutterAppDelegate {
//
//    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        GeneratedPluginRegistrant.register(with: self)
////        SqflitePlugin.register(with: self)
//        SqflitePlugin.init().path = DBFileUtil.getCurrentDatabasePath()
//        return super .application(application, didFinishLaunchingWithOptions: launchOptions)
//    }
//
//
//}
@UIApplicationMain
class AppDelegate: UIResponder,UIApplicationDelegate  {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
}

