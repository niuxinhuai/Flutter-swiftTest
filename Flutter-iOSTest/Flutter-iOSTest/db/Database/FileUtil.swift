//
// Created by Abe on 2018/1/10.
// Copyright (c) 2018 ZhiMiABC. All rights reserved.
//

import Foundation

struct FileUtil {
    static let libraryDirPath = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first!
    static let documentDirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    static let cacheDirPath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first!

    /// 确保该目录存在
    static func makeSureNotEmptyDir(atPath path: String) {
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true)
                addSkipBackupAttributeToItem(atPath: path)

            } catch { print("failed to create directory")}
        }
    }

    /// 去除目录itunes同步标记
    static func addSkipBackupAttributeToItem(atPath path: String) {
        var url = URL.init(fileURLWithPath: path)
        assert(FileManager.default.fileExists(atPath: path))

        do {
            var urlResourceValues = URLResourceValues()
            urlResourceValues.isExcludedFromBackup = false
            try url.setResourceValues(urlResourceValues)
        } catch  { print("failed to set resource value") }

    }

    static func getDatabaseDir() -> String {
        let path = libraryDirPath + "/db"
        makeSureNotEmptyDir(atPath: path)
        return path
    }

    static func getVoiceDir() -> String {
        let path = libraryDirPath + "/voice"
        makeSureNotEmptyDir(atPath: path)
        return path
    }

    static func getPictureDir() -> String {
        let path = libraryDirPath + "/picture"
        makeSureNotEmptyDir(atPath: path)
        return path
    }

}
