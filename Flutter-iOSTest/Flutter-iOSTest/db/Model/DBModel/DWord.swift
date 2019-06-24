//
//  DWord.swift
//  Durian
//
//  Created by Abe on 2017/12/25.
//  Copyright © 2017年 ZhiMiABC. All rights reserved.
//

import UIKit
import WCDBSwift

class DWord: DBaseModel,TableCodable {
    var id: Int?
    var lemma: String?
    var type: Int?
    var lemma_resolve: String?
    var uk_phonetic: String?
    var us_phonetic: String?
    var pos_first: String?
    

    enum CodingKeys: String, CodingTableKey {
        typealias Root = DWord
        static let objectRelationalMapping = TableBinding(CodingKeys.self)

        case id = "id"
        case lemma = "lemma"
        case type = "type"
        case lemma_resolve = "lemma_resolve"
        case uk_phonetic = "uk_phonetic"
        case us_phonetic = "us_phonetic"
        case pos_first = "pos_first"
    }
    
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(id, forKey: "id")
//        aCoder.encode(lemma, forKey: "lemma")
//        aCoder.encode(type, forKey: "type")
//        aCoder.encode(lemma_resolve, forKey: "lemma_resolve")
//        aCoder.encode(uk_phonetic, forKey: "uk_phonetic")
//        aCoder.encode(us_phonetic, forKey: "us_phonetic")
//        aCoder.encode(pos_first, forKey: "pos_first")
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        id = aDecoder.decodeObject(forKey: "id") as? Int
//        lemma = aDecoder.decodeObject(forKey: "lemma") as? String
//        type = aDecoder.decodeObject(forKey: "type") as? Int
//        lemma_resolve = aDecoder.decodeObject(forKey: "lemma_resolve") as? String
//        uk_phonetic = aDecoder.decodeObject(forKey: "uk_phonetic") as? String
//        us_phonetic = aDecoder.decodeObject(forKey: "us_phonetic") as? String
//        pos_first = aDecoder.decodeObject(forKey: "pos_first") as? String
//    }
//
//    init(_ id: Int?, _ lemma: String?, _ type: Int?, _ lemma_resolve: String?, _ uk_phonetic: String?, _ us_phonetic: String?, _ pos_first: String?) {
//        self.id = id
//        self.lemma = lemma
//        self.type = type
//        self.lemma_resolve = lemma_resolve
//        self.uk_phonetic = uk_phonetic
//        self.us_phonetic = us_phonetic
//        self.pos_first = pos_first
//    }
}
