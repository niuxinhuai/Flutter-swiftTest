//
//  SecondViewController.swift
//  Flutter-iOSTest
//
//  Created by 牛新怀 on 2019/6/14.
//  Copyright © 2019 牛新怀. All rights reserved.
//

import UIKit
import Flutter
import FlutterPluginRegistrant
class SecondViewController: FlutterViewController  {

    let array = ["crs","grs","nrs"]
    let callName = "callNativeMethond"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // splashScreenView存在于最顶层
        self.splashScreenView.backgroundColor = UIColor.blue
        self.splashScreenView.isHidden = true
        print("chash\(self.hash)")
        GeneratedPluginRegistrant.register(with: self)
        
//        GeneratedZPluginRegistrant.init()
//        SqfliteZPlugin.init()
        self.view.backgroundColor = UIColor.red
        self.navigationItem.title = "Flutter-iOSTest-Demo"
        self.loadDefaultSplashScreenView()
        // 要与main.dart中一致
        let channelName = "com.pages.flutter.iOSTest.demo"
        let messageChannel = FlutterMethodChannel.init(name: channelName, binaryMessenger: self)
        messageChannel.setMethodCallHandler { [weak self] (fc, fr) in
            guard let strongSelf = self else { return }
            // call.method 获取 flutter 给回到的方法名，要匹配到 channelName 对应的多个 发送方法名，一般需要判断区分
            // call.arguments 获取到 flutter 给到的参数，（比如跳转到另一个页面所需要参数）
            // result 是给flutter的回调， 该回调只能使用一次
            print("flutter 给到我 method:\(fc.method) arguments:\(fc.arguments)")
            if fc.method == strongSelf.array[2] {
                strongSelf.dismiss(animated: true, completion: {
                    print("dissmiss end of flutter")
                })
            }
            if fc.method == strongSelf.array[1] {
                
//                fr(DBFileUtil.getCurrentDatabasePath())
            }
            if fc.method == strongSelf.callName {
                //                fr("swift 传值成功")
//                fr(DBFileUtil.getCurrentDatabasePath())
            }
        }
        // Do any additional setup after loading the view.
    }
    

    

}
