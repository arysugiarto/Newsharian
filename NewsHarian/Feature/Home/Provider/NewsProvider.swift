//
//  Provider.swift
//  NewsHarian
//
//  Created by Ary Sugiarto on 20/12/22.
//

import Foundation
import Combine

protocol NewsAPI {
    var provider: HttpClient<ArticleEndpoint>{get}
    
    func fetchTopNews() -> AnyPublisher<Data, Error>
}

class NewsProvider: NewsAPI {
    
    var provider = HttpClient<ArticleEndpoint>()
    
    
    func fetchTopNews() -> AnyPublisher<Data, Error> {
        
        return provider.getData(from: .getTopHeadlines)
            
    }
    
    
    
}
