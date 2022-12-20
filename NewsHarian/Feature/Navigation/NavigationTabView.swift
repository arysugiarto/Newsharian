//
//  NavigationTabView.swift
//  NewsHarian
//
//  Created by Ary Sugiarto on 20/12/22.
//

import SwiftUI

struct NavigationTabView : View{

    var body: some View{
        TabView {
            HomeView()
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
            
            HomeView()
                .tabItem {
                    Label("Source", systemImage: "eyeglasses")
                }

            HomeView()
                .tabItem {
                    Label("Saved", systemImage: "heart")
                }
        }
        .accentColor(.primary)
        
    }
}


struct NavigationTabView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationTabView()
                .preferredColorScheme(.dark)
        }
    }
}

