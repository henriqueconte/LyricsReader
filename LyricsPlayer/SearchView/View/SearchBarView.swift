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
            Button(action: {
                self.webservice.fetchSearchMusicData(musicName: self.searchText) { (result) -> (Void) in
                    for musicHit in result?.response?.hits ?? [] {
                        self.musicList.append(MusicHit(details: musicHit.result))
                    }
                }
            }, label: {
                Text("Request Data")
                    .fontWeight(.semibold)
                    .font(Font.custom("Georgia", size: 20))
                    .foregroundColor(Color.red)
            })
            
            SearchBar(text: $searchText, placeholder: "Search songs")
            
            List {
                ForEach(self.musicList, id: \.self) { music in
                    Text((music.details?.title ?? "") + " - " + (music.details?.primary_artist?.name ?? ""))
                }
            }
        }
    }
}

struct SearchBar: UIViewRepresentable {
    
    @Binding var text: String
    var placeholder: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
    
    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = placeholder
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}
struct CSearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView().environmentObject(WebService())
    }
}



//struct SearchBarView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct SearchBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBarView()
//    }
//}
