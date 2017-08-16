//
//  db_CustomerList.swift
//  Hanson
//
//  Created by ParkPyosang on 2017. 7. 25..
//  Copyright © 2017년 Lily Jang. All rights reserved.
//

import Foundation


struct testCustomerData {
    let firstName : String
    let lastName : String
    let sin : String
    let birthDay : String
}

public class db_CustomerList
{
    func getCustomerList() -> (code: Int, msg: String, list: [testCustomerData]) {
        var errorCode = 0
        var errorMsg = ""
        var customerList = [testCustomerData]()
        
        let path = "http://lilyfactory.net/AliAPI/getCustomerList.php"
        
        
        let url = URL(string: path)
        let data = NSData(contentsOf: url!)
        
        do {
            
            let object = try JSONSerialization.jsonObject(with: data! as Data, options: .allowFragments)
            if let dictionary = object as? [String: AnyObject] {
                guard let dicCode = dictionary["ErrorCode"] as? Int,
                    let dicMessage = dictionary["Message"] as? String,
                    let dicList = dictionary["People"] as? [[String: AnyObject]]  else { return (errorCode, errorMsg, customerList)}
                errorCode = dicCode
                errorMsg = dicMessage
                
                for customers in dicList {
                    guard let dicfname = customers["firstName"] as? String,
                        let diclname = customers["lastName"] as? String,
                        let dicsin = customers["sin"] as? String,
                        let dicbirthday = customers["birthDay"] as? String else { break }
                    customerList.append(testCustomerData(firstName: dicfname,lastName: diclname, sin: dicsin, birthDay: dicbirthday));
                }
            }
            
            
        } catch {
            // Handle Error
        }
        
        return (errorCode, errorMsg, customerList)
    }
 
}
