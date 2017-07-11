//
//  db_AddressNBalance.swift
//  Hanson
//
//  Created by Lily Jang on 2017-07-05.
//  Copyright © 2017 Lily Jang. All rights reserved.
//

import Foundation

public class db_AddressNBalance
{
    func updateAddNBal(_ fName: String, _ lName: String, _ address: String, _ bal : String) -> (code: Int, msg: String)  {
        var errorCode = 0
        var errorMsg = ""
        
        var escapedAddressString = address.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        
        let path = "http://lilyfactory.net/AliAPI/updateAddressAndBalance.php?APIKey=918b247bd75322553d9036b998d1637e706b1fbe0015529ded9b1d55b2a68967&FirstName=" + fName + "&LastName=" + lName + "&Address=" + escapedAddressString! +  "&Balance=" + bal
        
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
