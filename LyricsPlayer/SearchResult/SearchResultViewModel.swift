//
//  SearchResultViewModel.swift
//  LyricsPlayer
//
//  Created by Guilherme Piccoli on 14/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import Foundation

class SearchResultViewModel: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var musicList: [MusicHit] = []

//    init() {
//        fetchResults()
//    }
    
    func fetchResults() {
        WebService().fetchSearchMusicData(musicName: searchText) { (result) -> (Void) in
            for musicHit in result?.response?.hits ?? [] {
                DispatchQueue.main.async {
                    self.musicList.append(MusicHit(details: musicHit.result))
                }
            }
        }
    }
}
