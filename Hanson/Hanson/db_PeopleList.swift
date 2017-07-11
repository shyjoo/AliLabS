//
//  getPeopleList.swift
//  Hanson
//
//  Created by Lily Jang on 2017-07-01.
//  Copyright © 2017 Lily Jang. All rights reserved.
//

import Foundation

struct testPepledata {
    let firstName : String
    let lastName : String
}

public class db_PeopleList
{
    func getPeopleList() -> (code: Int, msg: String, list: [testPepledata]) {
        var errorCode = 0
        var errorMsg = ""
        var peopleList = [testPepledata]()
        
        let path = "http://lilyfactory.net/AliAPI/getPeopleList.php?APIKey=918b247bd75322553d9036b998d1637e706b1fbe0015529ded9b1d55b2a68967"
        
        
        let url = URL(string: path)
        let data = NSData(contentsOf: url!)
        
        do {
            let object = try JSONSerialization.jsonObject(with: data! as Data, options: .allowFragments)
            if let dictionary = object as? [String: AnyObject] {
                guard let dicCode = dictionary["ErrorCode"] as? Int,
                    let dicMessage = dictionary["Message"] as? String,
                let dicList = dictionary["People"] as? [[String: AnyObject]]  else { return (errorCode, errorMsg, peopleList)}
                errorCode = dicCode
                errorMsg = dicMessage
                
                for person in dicList {
                    guard let dicfname = person["firstName"] as? String,
                        let diclname = person["lastName"] as? String else { break }
                     peopleList.append(testPepledata(firstName: dicfname,lastName: diclname));
                   }
                }
                
            
        } catch {
            // Handle Error
        }
        
        return (errorCode, errorMsg, peopleList)
    }
}
