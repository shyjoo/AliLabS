//
//  db_Prod_Purchased.swift
//  Hanson
//
//  Created by Lily Jang on 2017-07-01.
//  Copyright © 2017 Lily Jang. All rights reserved.
//

import Foundation

public class db_Prod_Purchased
{
    func updateProdPurchased(_ fName: String, _ lName: String, _ pp : String) -> (code: Int, msg: String)  {
        var errorCode = 0
        var errorMsg = ""
        
        let path = "http://localhost/AliAPI/updateProd_purchased.php?APIKey=28aece4f8f8643c39a0d6dc0e8f95e717f2117b42ac20835ca211ef85d112ed8&FirstName=" + fName + "&LastName=" + lName + "&PP=" + pp
        
        
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
