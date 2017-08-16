//
//  db_CustomerRegister.swift
//  Hanson
//
//  Created by ParkPyosang on 2017. 7. 27..
//  Copyright © 2017년 Lily Jang. All rights reserved.
//

import Foundation

public class db_CustomerRegister
{
    func customerRegister(_ firstName: String, _ lastName: String, _ sin: String, _ birthDay: String) -> (code: Int, msg: String) {
        var errorCode = 0;
        var errorMsg = "";
        
        let base64fname = firstName.toBase64();
        let base64lname = lastName.toBase64();
        let base64sin = sin.toBase64();
        let base64birthday = birthDay.toBase64();
        
        let path = "http://lilyfactory.net/AliAPI/userRegister.php?firstName=\(base64fname)&lastName=\(base64lname)&sin=\(base64sin)&birthDay=\(base64birthday)"
        //let path = "http://lilyfactory.net/AliAPI/loginAgency.php?name=\(base64id)&pass=\(base64pass)"
        
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
