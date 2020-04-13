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
        VStack {
            SearchBarView()
            .environmentObject(WebService())
            
            MainHorizontalScrollView(isFavoritesView: true)
                .environmentObject(MostReadData())
            MainHorizontalScrollView(isFavoritesView: false)
                .environmentObject(MostReadData())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
