//
//  SearchBarVIEW.swift
//  LyricsPlayer
//
//  Created by Guilherme Piccoli on 13/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import SwiftUI

//
//  ContentView.swift
//  LyricsPlayer
//
//  Created by Henrique Figueiredo Conte on 06/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import SwiftUI

struct SearchBarView: View {
    
    @EnvironmentObject var webservice: WebService
    @State var musicList: [MusicHit] = []
    @State private var searchText : String = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search Music", text: $searchText)
                    .padding(20)
                    .frame(width: 610, height: 55)
                    .font(Font.system(size: 21, weight: .regular))
                    .background(Color(red: 255 / 255, green: 55 / 255, blue: 95 / 255))
                
                
                NavigationLink(destination: SearchResultView()) {
//                    Button(action: {
//                        self.webservice.fetchSearchMusicData(musicName: self.searchText) { (result) -> (Void) in
//                            for musicHit in result?.response?.hits ?? [] {
//                                self.musicList.append(MusicHit(details: musicHit.result))
//                            }
//                        }
//                    }, label: {
                    Image("searchIcon").renderingMode(.original)
//                    })
//                }
                }
            }
            
            //            List {
            //                ForEach(self.musicList, id: \.self) { music in
            //                    Text((music.details?.title ?? "") + " - " + (music.details?.primary_artist?.name ?? ""))
            //                }
            //            }
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView().environmentObject(WebService())
    }
}
