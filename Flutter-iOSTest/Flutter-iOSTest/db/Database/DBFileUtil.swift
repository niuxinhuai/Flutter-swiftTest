//
// Created by Abe on 2018/1/9.
// Copyright (c) 2018 ZhiMiABC. All rights reserved.
//

import Foundation
import UIKit

struct DBFileUtil {
    static let DB_SUFFIX = "sqlite"
    static let BUNDLE_DB_NAME = "grapes_190419_encrypted"//加密20190616  
//    static let BUNDLE_DB_NAME = "grapes_190515_ct"//未加密
    static let DB_NAME = "core"
    static let NEW_DB_NAME = "newDB"


    static let fileManager: FileManager = FileManager.default

    static func getBundleDatabasePath() -> String {
        return Bundle.main.path(forResource: BUNDLE_DB_NAME, ofType: DB_SUFFIX)!
    }

    static func getDatabasePath(_ dbName: String) -> String {
        print(FileUtil.getDatabaseDir() + "/\(dbName).\(DB_SUFFIX)")
        return FileUtil.getDatabaseDir() + "/\(dbName).\(DB_SUFFIX)"
    }

    static func getCurrentDatabasePath() -> String {
        return getDatabasePath(DB_NAME)
    }

    static func isDBFileExists() -> Bool {
        let path = FileUtil.getDatabaseDir() + "/\(DB_NAME).\(DB_SUFFIX)"
        return fileManager.fileExists(atPath: path)

    }

    static func copyDatabase(isNewInstall: Bool) {
        let dbName = isNewInstall ? DB_NAME : NEW_DB_NAME
        
        let rawDBPath = getBundleDatabasePath()
        let targetDBPath = getDatabasePath(dbName)
    
        do {
            try fileManager.copyItem(atPath: rawDBPath, toPath: targetDBPath)
        } catch {
            print("copy database file error")
        }

    }

    static func deteleOldAndRenameNewDB() {
        let oldDBPath = getDatabasePath(DB_NAME)
        let newDBPath = getDatabasePath(NEW_DB_NAME)

        if fileManager.fileExists(atPath: newDBPath) {
            do {
                try fileManager.removeItem(atPath: oldDBPath)
                try fileManager.moveItem(atPath: newDBPath, toPath: oldDBPath)
            } catch {
                print("delete and rename database error: \(error.localizedDescription)")
            }

        }
    }


    // 备份方法

    // 恢复数据方法
}
