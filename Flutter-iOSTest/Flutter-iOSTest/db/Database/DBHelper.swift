    //
// Created by Abe on 2018/1/9.
// Copyright (c) 2018 ZhiMiABC. All rights reserved.
//

import Foundation
import WCDBSwift

class DBHelper {

    static let shared = DBHelper.init()
    var db: Database
    private init(){
        db = DBOpener.shared.database
    }

}

// MARK: - /// words
extension DBHelper {

    /// 根据word id获取单词
    func getWordById(wordId: Int) -> DWord? {
        var word: DWord?
        do {
            word = try db.getObject(fromTable: Tables.tb_word,
                                    where: DWord.Properties.id == wordId)
        } catch {
            print("database operation error:\(error.localizedDescription)")
        }

        return word
    }
    
    func wcdbText() {
        
        // 错误监控的示例代码
        Database.globalTrace(ofError: { (error) in
            switch error.type {
            case .sqliteGlobal:
                debugPrint("[WCDB][DEBUG] \(error.description)")
            case .warning:
                print("[WCDB][WARNING] \(error.description)")
            default:
                print("[WCDB][ERROR] \(error.description)")
            }
        })
        /*
         "SELECT * FROM gp_word WHERE id IN (SELECT DISTINCT word_id FROM gp_word_relation WHERE category_id = \(id) ORDER BY sort)"
         */
//            let order = [DWordRelation.Properties.sort.asOrder(by: .ascending)]
//            let statement = StatementSelect().select(distinct: true, DWordRelation.Properties.word_id).from(Tables.tb_word_relation).where(DWordRelation.Properties.category_id == 161).order(by: order)
//            let coreStatement = try db.prepare(statement)
//            while try coreStatement.step() {
//                let value = coreStatement.columnCount()
//                print(value)
//            }
            // 执行的所有sql语句排查
//            Database.globalTrace(ofSQL: { (sql) in
//                print("SQL: \(sql)")
//            })
    }
    
    // 根据单词id拿word
    func getAllWordByIdArray(ids: [Int]) -> [DWord] {
        var array = [DWord]()
        do {
            let condition = DWord.Properties.id.in(ids)
            
            array = try db.getObjects(fromTable: Tables.tb_word,
                                    where: condition)
        } catch {
            print("database operation error:\(error.localizedDescription)")
        }        
        return array
    }

}
    
