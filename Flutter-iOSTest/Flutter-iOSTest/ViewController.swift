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
//import WCDBSwift
//import sqlcipher
//import sqflite

class ViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DBHelper.shared.wcdbText()
        view.backgroundColor = UIColor.cyan
        let word = DBHelper.shared.getWordById(wordId: 1000)!
        print(word.lemma,word.id)
        
        
//        let key = "dadlwcp;;eldiblstoowkcl-209dl4l0b1-3-sle240-bsl;aelsigw"
//        let database = FMDatabase.init(path: DBFileUtil.getCurrentDatabasePath())
//        if database != nil {
//            guard database!.open() else {
//                print("can not be open FMDatabase")
//                return
//            }
////            DBHelper.shared.db.setFMDBCipher(key: key.data(using: .ascii), handlec: database!)
//            let sets = database!.executeQuery("SELECT * FROM sqlite_master where type='table';", withArgumentsIn: nil)
//            if sets != nil {
//                while(sets!.next()) {
//                    let s0 = sets!.columnName(for: 0)!
//                    let s1 = sets!.columnName(for: 1)!
//                    let s2 = sets!.columnName(for: 2)!
//                    let s3 = sets!.columnName(for: 3)!
//                    let s4 = sets!.columnName(for: 4)!
//                    print(s0,s1,s2,s3,s4)
//                }
//            }
//            
//        }
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

