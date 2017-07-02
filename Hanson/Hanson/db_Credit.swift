//
//  db_Credit.swift
//  Hanson
//
//  Created by Lily Jang on 2017-07-01.
//  Copyright © 2017 Lily Jang. All rights reserved.
//

import Foundation

public class db_Credit{
    func updateCredit(_ fName: String, _ lName: String, _ credit : String) -> (code: Int, msg: String) {
        var errorCode = 0
        var errorMsg = ""
        
        let path = "http://localhost/AliAPI/updateCredit.php?APIKey=918b247bd75322553d9036b998d1637e706b1fbe0015529ded9b1d55b2a68967&FirstName=" + fName + "&LastName=" + lName + "&Credit=" + credit
        
        
        let url = URL(string: path)
        let data = NSData(contentsOf: url!)
        
        do {
            let object = try JSONSerialization.jsonObject(with: data! as Data, options: .allowFragments)
            if let dictionary = object as? [String: AnyObject] {
                guard let dicCode = dictionary["ErrorCode"] as? Int,
                    let dicMessage = dictionary["Message"] as? String else { return (errorCode, errorMsg)}
                errorCode = dicCode
                errorMsg = dicMessage
                
            }
            
            
        } catch {
            // Handle Error
        }
        
        
        return (errorCode, errorMsg)
    }
}
