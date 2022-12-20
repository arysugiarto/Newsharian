//
//  NewsViewModel.swift
//  NewsHarian
//
//  Created by Ary Sugiarto on 20/12/22.
//

import Foundation
import Combine
import SwiftUI

class NewsViewModel: ObservableObject {
    private let provider: NewsProvider!
    private var bag = Set<AnyCancellable>()
    
    private(set) var article = [ArticleResponse]()
    var latesArticle: [ArticleResponse]{
        Array(article.shuffled()[0...5])
    }
    
    var errorState: HandledError?
    @Published var loadingState: Bool = true
    @Published var showErrorDialog: Bool = false
    
    init(provider: NewsProvider = NewsProvider()){
        self.provider = provider
    }
    
    func getTopHeadLines(){
        refreshState()
        loadingState = true
        
        provider.fetchTopNews()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { _ in },receiveValue: {[weak self] data in
                if let articleResponse = try? JSONDecoder().decode(NewsApiArticleResponse.self, from: data){
                    DispatchQueue.main.async{
                        self?.article = articleResponse.articles
                    }
                }else{
                    if let error = try? JSONDecoder().decode(HandledError.self, from: data){
                        self?.errorState = error
                        self?.showErrorDialog = true
                    }
                }
                self?.loadingState = false
            })
            .store(in: &bag)
    }
    
    func refreshState(){
        errorState = nil
        showErrorDialog = false
    }
}
