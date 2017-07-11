//
//  db_AnnualInfo.swift
//  Hanson
//
//  Created by Lily Jang on 2017-07-05.
//  Copyright © 2017 Lily Jang. All rights reserved.
//

import Foundation

public class db_AnnualInfo
{
    func updateAnnualInfo(_ year: String, _ purchase: String, _ usercount : String) -> (code: Int, msg: String)  {
        var errorCode = 0
        var errorMsg = ""
        
        let path = "http://lilyfactory.net/AliAPI/updateAnnualInfo.php?APIKey=28aece4f8f8643c39a0d6dc0e8f95e717f2117b42ac20835ca211ef85d112ed8&Year=" + year + "&Purcharse=" + purchase + "&UserCount=" + usercount
        
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
