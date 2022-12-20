//
//  NewsApiArticleResponse.swift
//  NewsHarian
//
//  Created by Ary Sugiarto on 20/12/22.
//

import Foundation

struct NewsApiArticleResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [ArticleResponse]
}

struct ArticleResponse: Codable, Identifiable, Hashable {
    var id: String = UUID().uuidString
    let source: ArticleSourceResponse
    let author: String?
    let title: String
    let articleDescription: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
    

}

struct ArticleSourceResponse: Codable, Identifiable, Hashable{
    let id: String?
    let name: String
}

