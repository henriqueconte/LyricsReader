//
//  ContentView.swift
//  LyricsPlayer
//
//  Created by Henrique Figueiredo Conte on 06/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            VStack(spacing: 27) {
                ZStack {
                    Image("kanyeWestBackground")
                        .resizable()
                    
                    VStack {
                        Spacer()
                            .frame(height: UIScreen.main.bounds.height * 0.2)
                        
                        SearchBarView()
                            .environmentObject(WebService())
                        Spacer()
                            .frame(height: UIScreen.main.bounds.height * 0.15)
                        
                        MainHorizontalScrollView(isFavoritesView: true)
                            .environmentObject(MostReadData())
                            .environmentObject(FavoritesData())
                        MainHorizontalScrollView(isFavoritesView: false)
                            .environmentObject(MostReadData())
                            .environmentObject(FavoritesData())
                        
                        Spacer()
                            .frame(height: UIScreen.main.bounds.height * 0.05)
    
                    }

                }
                    .edgesIgnoringSafeArea(.all)
            
                ZStack {
                    Rectangle()
                        .fill(Color(red: 28/255, green: 28/255, blue: 30/255))
                        .offset(x: 0, y: -27)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 120)
                        
                    
                    PlayerBarView()
                        .background(Color(red: 28/255, green: 28/255, blue: 30/255))
                }
            }
//                .background(Color(red: 28/255, green: 28/255, blue: 30/255))

        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
