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
                SearchBarView()
                    .environmentObject(WebService())
                
                MainHorizontalScrollView(isFavoritesView: true)
                    .environmentObject(MostReadData())
                    .environmentObject(FavoritesData())
                MainHorizontalScrollView(isFavoritesView: false)
                    .environmentObject(MostReadData())
                    .environmentObject(FavoritesData())
            }
        }
            .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
