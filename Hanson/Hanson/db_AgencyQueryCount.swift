//
//  db_AgencyQueryCount.swift
//  Hanson
//
//  Created by Lily Jang on 2017-07-14.
//  Copyright © 2017 Lily Jang. All rights reserved.
//

import Foundation

struct countData {
    let name : String
    let count : Int
}

public class db_AgencyQueryCount
{
    func getAgencyQueryCount() -> (code: Int, msg: String, list: [countData]) {
        var errorCode = 0
        var errorMsg = ""
        var countList = [countData]()
        
        let path = "http://lilyfactory.net/AliAPI/getQueryCountByAgency.php?APIKey=7a5f12749882351b2afa49101a4c9da77498a46a45aec0f9f2eb92a6a40f93c7"
        
        
        let url = URL(string: path)
        let data = NSData(contentsOf: url!)
        
        do {
            let object = try JSONSerialization.jsonObject(with: data! as Data, options: .allowFragments)
            if let dictionary = object as? [String: AnyObject] {
                guard let dicCode = dictionary["ErrorCode"] as? Int,
                    let dicMessage = dictionary["Message"] as? String,
                    let dicList = dictionary["QueryCount"] as? [[String: AnyObject]]  else { return (errorCode, errorMsg,  countList)}
                errorCode = dicCode
                errorMsg = dicMessage
                
                for log in dicList {
                    guard let dicName = log["agencyName"] as? String! ?? "",
                        let dicCount = log["count"] as? String! ?? "" else { break }
                    if dicName != "" {
                        countList.append(countData(name: dicName, count: Int(dicCount)!));
                    }
                    
                }
            }
            
            
        } catch {
            // Handle Error
        }
        
        return (errorCode, errorMsg, countList)
    }
}
