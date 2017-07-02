//
//  db_Login.swift
//  Hanson
//
//  Created by Lily Jang on 2017-06-30.
//  Copyright © 2017 Lily Jang. All rights reserved.
//

import Foundation

extension String {
    /// Encode a String to Base64
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
    
    /// Decode a String from Base64. Returns nil if unsuccessful.
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

public class db_Login
{
    func loginAdmin(_ id: String, _ pass: String) -> (code: Int, msg: String) {
        var errorCode = 0;
        var errorMsg = "";
        
        let base64id = id.toBase64();
        let base64pass = pass.toBase64();
        
        let path = "http://localhost/AliAPI/loginAgency.php?name=\(base64id)&pass=\(base64pass)"
        
        
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
