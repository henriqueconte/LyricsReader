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
                self.coverImages[index]
                    .resizable()
                    .cornerRadius(5)
                    .brightness(-0.1)
                    .frame(width: self.isFavoritesView ? 144 : 89, height: self.isFavoritesView ? 144 : 89)
                    .aspectRatio(contentMode: .fit)
                    
                
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.clear)
                        .innerShadow(color: Color.black.opacity(0.8), radius: 1)
                )
                    
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(red: 255/255, green: 55/255, blue: 95/255), lineWidth: 1)
                    )
                
                .overlay(Text(self.songNames[index])
                    .font(.system(size: 12))
                    .foregroundColor(Color.white)
                    .lineLimit(1)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                    .padding(8))
                
//                .overlay(MarqueeText(text: self.artistNames[index] + " - " + self.songNames[index])
//                .font(.system(size: 12))
//                     .padding(4))
                
                    .padding(7.5)
                
            
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
            Text(isFavoritesView ? "Favorites" : "Most Read")
                .font(.system(size: 21))
                .bold()
                .foregroundColor(Color(red: 255/255, green: 55/255, blue: 95/255))
            
            //Spacer()
            
            horizontalScrollCollectionView
        }
    }
}

struct MainHorizontalScrollView_Previews: PreviewProvider {
    static var previews: some View {
        MainHorizontalScrollView(artistNames: ["Pink Floyd", "Frank Ocean"], songNames: ["The Dark Side Of The Moon", "Blond"], coverImages: [Image("darkSideOfTheMoon"), Image("blond")], isFavoritesView: true)
        .previewDevice("iPad mini 4")
            .previewLayout(
                PreviewLayout.fixed(
                    width: 2732.0,
                    height: 2048.0
            )
        )
    }
}
