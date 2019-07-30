//
//  ViewController.swift
//  Flutter-iOSTest
//
//  Created by 牛新怀 on 2019/5/22.
//  Copyright © 2019 牛新怀. All rights reserved.
//

import UIKit
import Flutter
import FlutterPluginRegistrant

class ViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = UIColor.cyan
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
//        SqfliteOperation
        self.view.addSubview(button)
        
    }
    
    @objc func didSelectButtonClick() {
        let flutter = SecondViewController.init()
//        GeneratedPluginRegistrant.regi
        
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

