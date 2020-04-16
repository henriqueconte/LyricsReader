//
//  SearchResultView.swift
//  LyricsPlayer
//
//  Created by Guilherme Piccoli on 13/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import SwiftUI

struct SearchResultView: View {
    
    let searchText : String
    
    @EnvironmentObject var model: SearchResultViewModel
    @Binding var shouldPopToRootView : Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            if !model.musicList.isEmpty {
                HStack {
                    Text("Search Results")
                        .font(Font.system(size: 21, weight: .bold))
                        .foregroundColor(Color(red: 255 / 255, green: 55 / 255, blue: 95 / 255))
                        .offset(x: 84, y: 0)
                }
                
                HStack {
                    GeometryReader { geometry in
                        List {
                            ForEach(self.model.musicList, id: \.self) { music in
                                NavigationLink(destination: LyricsView(artistName: music.details?.primary_artist?.name ?? "", trackName: music.details?.title ?? "")
                                    .environmentObject(WebService())
                                    .environmentObject(HTMLParse())) {
                                    HStack {
                                        Image(uiImage: music.details?.header_image_thumbnail_url?.getImageFromURL() ?? UIImage())
                                            .resizable()
                                            .cornerRadius(5)
                                            .brightness(-0.1)
                                            .frame(width: 85, height: 85)
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
                                        HStack {
                                            Text((music.details?.title ?? ""))
                                                .font(Font.system(size: 17, weight: .bold))
                                                .foregroundColor(Color(red: 255 / 255, green: 55 / 255, blue: 95 / 255))
                                            Text("-").font(Font.system(size: 17, weight: .bold))
                                                .foregroundColor(Color(red: 255 / 255, green: 55 / 255, blue: 95 / 255))
                                            Text((music.details?.primary_artist?.name ?? ""))
                                                .font(Font.system(size: 17, weight: .bold))
                                                .foregroundColor(Color(red: 255 / 255, green: 55 / 255, blue: 95 / 255))
                                            
                                        }
                                    }
                                }
                            }.padding(5)
                        }.offset(x: 125, y: 0).background(Color.clear).frame(width: geometry.size.width / 2, height: geometry.size.height)
                        
                        Spacer()
                    }
                    
                    Button(action: {
                        self.shouldPopToRootView = false
                    }) {
                        Image("searchIcon").renderingMode(.original)
                    }.padding(.trailing, 50)
                }
                
                
            }
        }.navigationBarHidden(true)
            .navigationBarTitle(Text("Home"))
            .edgesIgnoringSafeArea([.top, .bottom])
            .padding(.top, 50)
            .onAppear() {
                self.model.searchText = self.searchText
                self.model.fetchResults()
        }
    }
}

//struct SearchResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchResultView(searchText: "Love yourself").environmentObject(WebService()).previewDevice("iPad mini 4")
//            .previewLayout(
//                PreviewLayout.fixed(
//                    width: 2732.0,
//                    height: 2048.0
//                )
//        )
//    }
//}




