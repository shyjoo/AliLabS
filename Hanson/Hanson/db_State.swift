//
//  db_State.swift
//  Hanson
//
//  Created by Lily Jang on 2017-07-01.
//  Copyright © 2017 Lily Jang. All rights reserved.
//

import Foundation

public class db_State{
    func getState(_ fName: String, _ lName: String) -> (code: Int, msg: String, state: String) {
        var errorCode = 0
        var errorMsg = ""
        var state = ""
        
        let path = "http://localhost/AliAPI/getState.php?APIKey=b17ada736691f36aacbf89d425052ce74422a10744912b09332568be874536fc&FirstName=" + fName + "&LastName=" + lName
        
        
        let url = URL(string: path)
        let data = NSData(contentsOf: url!)
        
        do {
            let object = try JSONSerialization.jsonObject(with: data! as Data, options: .allowFragments)
            if let dictionary = object as? [String: AnyObject] {
                guard let dicCode = dictionary["ErrorCode"] as? Int,
                    let dicMessage = dictionary["Message"] as? String,
                    let dicState = dictionary["State"] as? String  else { return (errorCode, errorMsg, state)}
                errorCode = dicCode
                errorMsg = dicMessage
                state = dicState
                
            }
            
            
        } catch {
            // Handle Error
        }
        
        
        return (errorCode, errorMsg, state)
    }
}
