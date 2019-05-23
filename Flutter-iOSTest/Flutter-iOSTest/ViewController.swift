//
//  ViewController.swift
//  Flutter-iOSTest
//
//  Created by 牛新怀 on 2019/5/22.
//  Copyright © 2019 牛新怀. All rights reserved.
//

import UIKit
import Flutter

class ViewController: UIViewController {

    let array = ["crs","grs","nrs"]
    let callName = "callNativeMethond"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(button)
    }
    
    @objc func didSelectButtonClick() {
        let flutter = FlutterViewController.init()
        flutter.navigationItem.title = "Flutter-iOSTest-Demo"
        flutter.loadDefaultSplashScreenView()
        // 要与main.dart中一致
        let channelName = "com.pages.flutter.iOSTest.demo"
        let messageChannel = FlutterMethodChannel.init(name: channelName, binaryMessenger: flutter)
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
                fr("flutter back source")
            }
            if fc.method == strongSelf.callName {
                fr("swift 传值成功")
            }
        }
        
        
        self.present(flutter, animated: true) {
            print("end of flutter present")
        }
//        self.navigationController?.pushViewController(flutter, animated: true)
    }
    
    lazy var button : UIButton = {
        let object = UIButton()
        object.backgroundColor = UIColor.red
        object.center = CGPoint.init(x: UIScreen.main.bounds.size.width/2, y: UIScreen.main.bounds.size.height/2)
        object.bounds = CGRect.init(x: 0, y: 0, width: 200, height: 200)
        object.addTarget(self, action: #selector(didSelectButtonClick), for: .touchUpInside)
        return object
    }()

}

