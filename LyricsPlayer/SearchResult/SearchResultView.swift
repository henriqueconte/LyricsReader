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
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 30) {
            if !model.musicList.isEmpty {
                
                Text("Search Results")
                    .font(Font.system(size: 21, weight: .bold))
                    .foregroundColor(Color(red: 255 / 255, green: 55 / 255, blue: 95 / 255))
                    .offset(x: 84, y: 0)
                
                List {
                    ForEach(self.model.musicList, id: \.self) { music in
                        HStack {
                            Image(uiImage: music.details?.header_image_thumbnail_url?.getImageFromURL() ?? UIImage()).resizable().frame(width: 70, height: 70)
                            
                            Text((music.details?.title ?? ""))
                                .font(Font.system(size: 17, weight: .bold))
                                .foregroundColor(Color(red: 255 / 255, green: 55 / 255, blue: 95 / 255))
                        }
                    }
                }
            }
        }.onAppear() {
            self.model.searchText = self.searchText
            self.model.fetchResults()
        }
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView(searchText: "Love yourself").environmentObject(WebService())
    }
}




