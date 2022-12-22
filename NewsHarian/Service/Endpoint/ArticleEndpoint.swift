//
//  ArticleEndpoint.swift
//  NewsHarian
//
//  Created by Ary Sugiarto on 20/12/22.
//

import Foundation

enum ArticleEndpoint : EndpointProtocol{
    case getTopHeadlines
    case getArticlesFromCategory(_ category: String)
    case getSources
    case getArticlesFromSource(_ source: String)
    case searchForArticles(searchFilter: String)
    
    
    var baseURL: String {
        return Constant.API.basicUrl
    }
    
    var absoluteURL: String {
        switch self {
        case .getTopHeadlines, .getArticlesFromCategory:
            return baseURL + "/top-headlines"
            
        case .getSources:
            return baseURL + "/top-headlines/sources"
            
        case .getArticlesFromSource, .searchForArticles:
            return baseURL + "/everything"
        }
    }
    
    var params: [String: String] {
        switch self {
        case .getTopHeadlines:
            return ["country": region]
            
        case let .getArticlesFromCategory(category):
            return ["country": region, "category": category]
            
        case .getSources:
            return ["language": locale]
            
        case let .getArticlesFromSource(source):
            return ["sources": source]
            
        case let .searchForArticles(searchFilter):
            return ["q": searchFilter, "language": locale]
        }
    }
    
    var headers: [String: String] {
        
        if(Constant.API.apiKey.isEmpty){
            //insert news api token into Constant file
            fatalError()
        }
        
        return [
            "X-Api-Key": Constant.API.apiKey,
            "Content-type": "application/json",
            "Accept": "application/json"
        ]
    }
}
