//
//  HttpClientErrors.swift
//  NewsHarian
//
//  Created by Ary Sugiarto on 20/12/22.
//

import Foundation

enum HttpClientErrors: Error {
    case invalidURL
    case dataNil
    case decodingError
    case unknownError
    
    var errorDescription: String? {
        switch self {
        case .dataNil:
            return "Empty data."
        case .decodingError:
            return "Data has invalid format."
        default:
            return "Something goes wrong."
        }
    }
}
