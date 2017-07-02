//
//  db_SinNumber.swift
//  Hanson
//
//  Created by Lily Jang on 2017-07-01.
//  Copyright © 2017 Lily Jang. All rights reserved.
//

import Foundation

public class db_SinNumber{
    func getSinNumber(_ fName: String, _ lName: String) -> (code: Int, msg: String, sin: String) {
        var errorCode = 0
        var errorMsg = ""
        var sin = ""
        
        let path = "http://localhost/AliAPI/getSinnumber.php?APIKey=918b247bd75322553d9036b998d1637e706b1fbe0015529ded9b1d55b2a68967&FirstName=" + fName + "&LastName=" + lName
        
        
        let url = URL(string: path)
        let data = NSData(contentsOf: url!)
        
        do {
            let object = try JSONSerialization.jsonObject(with: data! as Data, options: .allowFragments)
            if let dictionary = object as? [String: AnyObject] {
                guard let dicCode = dictionary["ErrorCode"] as? Int,
                    let dicMessage = dictionary["Message"] as? String,
                    let dicSin = dictionary["SinNumber"] as? String  else { return (errorCode, errorMsg, sin)}
                errorCode = dicCode
                errorMsg = dicMessage
                sin = dicSin
                
            }
            
            
        } catch {
            // Handle Error
        }
        
        
        return (errorCode, errorMsg, sin)
        
    }
}
