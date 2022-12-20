//
//  HandledError.swift
//  NewsHarian
//
//  Created by Ary Sugiarto on 20/12/22.
//

import Foundation

struct HandledError: Codable{
    
    let status, code, message: String
    
    public func readableMessage() -> String {
        if(!code.isEmpty){
            return "Status code: \(code) \n \(message)"
        }else{
            return message
        }
    }
    
}
