//
//  db_TotalQuery.swift
//  Hanson
//
//  Created by Lily Jang on 2017-07-12.
//  Copyright © 2017 Lily Jang. All rights reserved.
//

import Foundation

struct logData {
    let id : String
    let name : String
    let queryId : String
    let queryDate : String
    let errorCode : String
    let message : String
    let param1 : String
    let param2 : String
    let param3 : String
    let param4 : String
}

public class db_TotalQuery
{
    func getTotalQuery() -> (code: Int, msg: String, tcnt: Int, scnt: Int, ecnt:Int, list: [logData]?) {
        var errorCode = 0
        var errorMsg = ""
        var totalCount = 0
        var successCount = 0
        var errorCount = 0
        var logList = [logData]()
        
        let path = "http://lilyfactory.net/AliAPI/getTotalQueryCount.php?APIKey=7a5f12749882351b2afa49101a4c9da77498a46a45aec0f9f2eb92a6a40f93c7"
        
        
        let url = URL(string: path)
        let data = NSData(contentsOf: url!)
        
        do {
            let object = try JSONSerialization.jsonObject(with: data! as Data, options: .allowFragments)
            if let dictionary = object as? [String: AnyObject] {
                guard let dicCode = dictionary["ErrorCode"] as? Int,
                    let dicMessage = dictionary["Message"] as? String,
                    let dicTcnt = dictionary["LogCount"] as? Int,
                    let dicScnt = dictionary["SuccessCount"] as? Int,
                    let dicEcnt = dictionary["ErrorCount"] as? Int,
                    let dicList = dictionary["LogTrace"] as? [[String: AnyObject]]! ?? nil
                    else { return (errorCode, errorMsg, totalCount, successCount, errorCount, logList)}
                errorCode = dicCode
                errorMsg = dicMessage
                totalCount = dicTcnt
                successCount = dicScnt
                errorCount = dicEcnt
                
                for log in dicList {
                    guard let dicId = log["id"] as? String,
                        let dicName = log["agencyName"] as? String,
                    let dicQueryID = log["queryID"] as? String,
                    let dicQueryDate = log["queryDate"] as? String,
                    let dicErrorCode = log["errorCode"] as? String,
                    let dicMsg = log["message"] as? String,
                    let dicParam1 = log["param1"] as? String! ?? "",
                    let dicParam2 = log["param2"] as? String! ?? "",
                    let dicParam3 = log["param3"] as? String! ?? "",
                    let dicParam4 = log["param4"] as? String! ?? "" else { break }
                    logList.append(logData(id: dicId, name: dicName, queryId: dicQueryID,queryDate: dicQueryDate,                                            errorCode: dicErrorCode, message: dicMsg, param1: dicParam1,                                           param2: dicParam2, param3: dicParam3, param4: dicParam4));
                }
            }
            
            
        } catch {
            // Handle Error
        }
        
        return (errorCode, errorMsg, totalCount, successCount, errorCount, logList)
    }
}
