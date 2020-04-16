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
                
                PlayerBarView()
            }
                .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
