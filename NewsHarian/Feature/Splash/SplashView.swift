//
//  SplahView.swift
//  NewsHarian
//
//  Created by Ary Sugiarto on 20/12/22.
//

import Foundation
import SwiftUI

struct SplashView: View {
    
    @State private var endSplash = false
    
    func delaynavigation(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            endSplash = true
        }
    }
    
    var body : some View {
        if (!endSplash){
            SplashContent()
                .onAppear(){
                    delaynavigation()
                }
            }else {
                NavigationTabView()
                    .animation(.easeIn)
                    .transition(.opacity)
            }
        }
    }
    
    struct SplashContent: View {
        @Environment(\.colorScheme) var colorScheme
        
        var body: some View {
            
            VStack{
                
                if(colorScheme == .dark){
                    
                    LottieView(name: "news", loopMode: .playOnce)
                        .frame(width: 300, height: 300)
                }else{
                    
                    LottieView(name: "news", loopMode: .playOnce)
                        .frame(width: 300, height: 300)
                }
             }
        }
    }

    
    struct SplashIntro_Previews : PreviewProvider {
        static var previews : some View {
            
            SplashView()
                .preferredColorScheme(.dark)
        }
    
}
