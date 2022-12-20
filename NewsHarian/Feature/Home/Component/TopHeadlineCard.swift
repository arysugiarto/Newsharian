//
//  TopHeadlineCard.swift
//  NewsHarian
//
//  Created by Ary Sugiarto on 20/12/22.
//

import Foundation
import Kingfisher
import SwiftUI

struct TopHeadlineCard : View {
    var article : ArticleResponse
    
    struct CardModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
        }
    }

    
    var body: some View {
        ZStack(alignment: .bottom){
            KFImage(URL(string: article.urlToImage ?? ""))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.size.width - 20,
                height: 300,
                       alignment: .center)
                .modifier(CardModifier())
            Rectangle()
                .foregroundColor(.black)
                .opacity(0.5)
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.size.width - 20,
                height: 300,
                       alignment: .center)
                .modifier(CardModifier())
            
            TopHeadlineCardContent(article: article)
            
        }
    }
}

struct TopHeadlineCardContent: View {
    
    var article: ArticleResponse
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(verbatim: article.source.name)
                .foregroundColor(.white)
                .font(.subheadline)
                .lineLimit(1)
                .multilineTextAlignment(.leading)
                .padding([.leading, .trailing], 20)
                .padding(.bottom, 4)
            
            Text(verbatim: article.title )
                .foregroundColor(.white)
                .font(.headline)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .padding([.leading, .bottom, .trailing], 20)
        }
        
        
    }
}


struct TopHeadlineCard_Previews: PreviewProvider {
    static var previews: some View {
        
        let article = ArticleResponse(
            source: ArticleSourceResponse(id: "", name: "CNN"),
            author: "test",
            title: "Russian Missiles Strike Ukrainian Military Training Base Near Polish Border - The Wall Street Journal",
            articleDescription: "Attack on site where U.S. trained local forces kills at least 35, follows Moscow warning that arms shipments to Kyiv won’t be tolerated",
            url: "https://www.wsj.com/articles/russian-missiles-strike-ukrainian-military-training-base-near-polish-border-11647169428",
            urlToImage: "https://images.wsj.net/im-503948/social",
            publishedAt: "2022-03-13T16:44:47Z",
            content: "A Russian airstrike killed 35 people at a Ukrainian military training center about 10 miles from the Polish border early Sunday, one day after Moscow warned the West that it would consider arms deliv…")
        
        TopHeadlineCard(article: article)
        .frame(width: .infinity, height: 300, alignment: .center)
    }
}
