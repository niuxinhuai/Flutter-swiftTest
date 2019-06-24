//
//  DBaseModel.swift
//  Durian
//
//  Created by Abe on 2017/12/25.
//  Copyright © 2017年 ZhiMiABC. All rights reserved.
//

import UIKit

class DBaseModel: NSObject {
    override var description: String {
        get {
            var dict = [String: AnyObject]()
            var count: UInt32 = 0
            let properties = class_copyIvarList(type(of: self), &count)
            for i in 0..<count {
                let property = (properties?[Int(i)])!
                let t = property_getName(property)
                if let n = NSString(cString: t, encoding: String.Encoding.utf8.rawValue) as String?
                {
                    let v = self.value(forKey: n) ?? "nil"
                    dict[n] = v as AnyObject?
                }
            }
            free(properties)
            return "\(type(of: self)):\(dict)"
        }
    }
}
