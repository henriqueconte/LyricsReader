//
//  SearchResultView.swift
//  LyricsPlayer
//
//  Created by Guilherme Piccoli on 13/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import SwiftUI

struct SearchResultView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView()
    }
}


//                    Button(action: {
//                        self.webservice.fetchSearchMusicData(musicName: self.searchText) { (result) -> (Void) in
//                            for musicHit in result?.response?.hits ?? [] {
//                                self.musicList.append(MusicHit(details: musicHit.result))
//                            }
//                        }
//                    }, label: {


//            List {
//                ForEach(self.musicList, id: \.self) { music in
//                    Text((music.details?.title ?? "") + " - " + (music.details?.primary_artist?.name ?? ""))
//                }
//            }
