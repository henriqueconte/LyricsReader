//
//  MostReadHorizontalScrollView.swift
//  LyricsPlayer
//
//  Created by Felipe Girardi on 07/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import SwiftUI

struct MainHorizontalScrollView: View {
    var artistNames: [String]
    var songNames: [String]
    var coverImages: [Image]
    var isFavoritesView: Bool
    
    var horizontalScrollCollectionCell: some View {
        ForEach(0..<songNames.count, id: \.self) { index in
           ZStack {
               self.coverImages[index]
                   .resizable()
                   .cornerRadius(5)
                .frame(width: self.isFavoritesView ? 150 : 100, height: self.isFavoritesView ? 150 : 100)
                   .aspectRatio(contentMode: .fit)
                   .padding(4)
               
               Text(self.artistNames[index] + " - " + self.songNames[index])
                   .font(.system(size: 12))
                
                   //.padding(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 50))
               
            }
        }
    }
    
    var horizontalScrollCollectionView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
             HStack {
                horizontalScrollCollectionCell
             }
        }
    }
    
    var body: some View {
        VStack {
            Text("Favorites")
                .font(.system(size: 18))
                .bold()
                .foregroundColor(Color.black)
            
            horizontalScrollCollectionView
        }
    }
}

struct MainHorizontalScrollView_Previews: PreviewProvider {
    static var previews: some View {
        MainHorizontalScrollView(artistNames: ["Frank Ocean", "Frank Ocean", "Frank Ocean", "Frank Ocean", "Frank Ocean", "Frank Ocean", "Frank Ocean", "Frank Ocean", "Frank Ocean", "Frank Ocean", "Frank Ocean", "Frank Ocean", "Frank Ocean", "Frank Ocean", "Frank Ocean", "Frank Ocean", "Frank Ocean", "Frank Ocean", "Frank Ocean", "Frank Ocean"], songNames: ["Blond", "Blond", "Blond", "Blond", "Blond", "Blond", "Blond", "Blond", "Blond", "Blond", "Blond", "Blond", "Blond", "Blond", "Blond", "Blond", "Blond", "Blond", "Blond", "Blond"], coverImages: [Image("blond"), Image("blond"), Image("blond"), Image("blond"), Image("blond"), Image("blond"), Image("blond"), Image("blond"), Image("blond"), Image("blond"), Image("blond"), Image("blond"), Image("blond"), Image("blond"), Image("blond"), Image("blond"), Image("blond"), Image("blond"), Image("blond"), Image("blond")], isFavoritesView: true)
    }
}
