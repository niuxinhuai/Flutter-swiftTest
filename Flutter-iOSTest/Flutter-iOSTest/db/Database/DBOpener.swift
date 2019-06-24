//
// Created by Abe on 2018/1/9.
// Copyright (c) 2018 ZhiMiABC. All rights reserved.
//

import Foundation
import WCDBSwift

struct DBOpener {

    static let shared = DBOpener()
    
    var database: Database
    
//    lazy var database: Connection = {
//        let isDBFileExists = DBFileUtil.isDBFileExists()
//        if isDBFileExists {
//            return DBOpener.databaseFromNormalUser()!
//        } else  {// 新安装
//            return DBOpener.databaseFromNewUser()!
//        }
//    }()
    
    private init() {
        let isDBFileExists = DBFileUtil.isDBFileExists()
        if isDBFileExists {
            database = DBOpener.databaseFromNormalUser()!
        } else  {// 新安装
            database = DBOpener.databaseFromNewUser()!
        }
    }

    static func databaseFromNewUser() -> Database? {
        DBFileUtil.copyDatabase(isNewInstall: true)
        let db = openDB()
        // 备份数据库
//        DispatchQueue.global().async {
//            DBHelper.shared.addUniqueIndex()
//        }
        return db
    }

    static func databaseFromNormalUser() -> Database? {
        let db = openDB()
        //TODO: 备份数据库
        return db
    }
    
    func sd() {
        
    }

    static func openDB() -> Database? {
//        let key = "dadlwcp;;eldiblstoowkcl-209dl4l0b1-3-sle240-bsl;aelsigw"//
        let key = "0eplvqDJRbczhengjunNKDN-aa98C3ZBg4hangyingYyGaEjbxO9YMw"
        
        //
        let db = Database(withPath: DBFileUtil.getCurrentDatabasePath())
        db.setCipher(key: key.data(using: .ascii))
        
        return db
    }
}

//extension Database {
//    func RD(key: Data) {
//        let rc = key.withUnsafeBytes ({ (bytes: UnsafePointer<Int8>) -> Int32 in
//            return sqlite3_key(nil, bytes, Int32(key.count))
//        })
//    }
//}

//extension Handle {
//    public func setabc(key: Data, sqlite3 * db) {
//        let rc = key.withUnsafeBytes ({ (bytes: UnsafePointer<Int8>) -> Int32 in
//            return sqlite3_key(db, bytes, Int32(key.count))
//        })
//    }
//}


