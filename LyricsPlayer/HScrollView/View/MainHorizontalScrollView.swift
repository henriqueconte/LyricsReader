//
//  MostReadHorizontalScrollView.swift
//  LyricsPlayer
//
//  Created by Felipe Girardi on 07/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import SwiftUI

struct MainHorizontalScrollView: View {
    @EnvironmentObject var mostReadTracksData: MostReadData
    //var artistNames: [String]
    //var songNames: [String]
    //var albumImages: [Image] = [Image("blond")]
    var isFavoritesView: Bool
    @State var mostReadTracksFetched: Bool = false
    
    func fetchAlbumImagesRequest(index: Int, trackInfo: TrackList, group: DispatchGroup) {
        group.enter()
        self.mostReadTracksData.fetchAlbumImages(artist: trackInfo.track?.artistName ?? "", album: trackInfo.track?.albumName ?? "", completion: { (result) -> (Void) in
        
            var albumImage: Image = Image("noAlbumImage")
        
            switch(result) {
            case "JSON Error":
                print("JSON Error")
            case self.mostReadTracksData.tempImageString:
                if(self.mostReadTracksData.tempImageString != "") {
                    let imageURL = URL(string: self.mostReadTracksData.tempImageString)!
                    let imageData = try? Data(contentsOf: imageURL)
                    let albumUIImage = UIImage(data: imageData ?? Data())
                    albumImage = Image(uiImage: albumUIImage ?? UIImage())
                }
            case "noAlbumImage":
                break
            default:
                print("error")
            }
            
            DispatchQueue.main.async {
                self.mostReadTracksData.tracksAndAlbums[index] = TrackAndAlbum(track: trackInfo.track, album: albumImage)
                group.leave()
            }
        })
    }
    
    var horizontalScrollCollectionCell: some View {
        ForEach(self.mostReadTracksData.tracksAndAlbums, id: \.self) { trackAndAlbum in
            trackAndAlbum.album?
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
                
                .overlay(Text(trackAndAlbum.track?.trackName ?? "")
                    .font(.system(size: 12))
                    .foregroundColor(Color.white)
                    .lineLimit(1)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                    .padding(8)
                )
                
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
            
            if(self.mostReadTracksFetched) {
                horizontalScrollCollectionView
            } else {
                horizontalScrollCollectionView.hidden()
            }
                
        }
        .onAppear() {
            if(!self.isFavoritesView) {
                self.mostReadTracksData.fetchMostReadLyrics(completion: { (result) -> (Void) in
                    switch(result) {
                    case .failure(let error):
                        print("Error")
                        print(error.localizedDescription)
                    case .success(let trackList):
                        
                        self.mostReadTracksFetched = true
                        
                        if(trackList.isEmpty) {
                            print("No tracks found in API")
                        } else {
                            print("Tracks obtained")
                        }
                        
                        DispatchQueue.main.async {
                            self.mostReadTracksData.tracksAndAlbums.removeAll()
                            for trackInfo in trackList {
                                if let track = trackInfo.track {
                                    self.mostReadTracksData.tracksAndAlbums.append(TrackAndAlbum(track: track, album: Image("noAlbumImage")))
                                }
                            }
                        }
                        
                        let configuration = URLSessionConfiguration.default
                        configuration.httpMaximumConnectionsPerHost = 10
                        
                        let group1 = DispatchGroup()
                        let group2 = DispatchGroup()
                        let group3 = DispatchGroup()
                        let group4 = DispatchGroup()
                        let group5 = DispatchGroup()
                        
                        for (index, trackInfo) in trackList[0..<2].enumerated() {
                            self.fetchAlbumImagesRequest(index: index, trackInfo: trackInfo, group: group1)
                        }
                        for (index, trackInfo) in trackList[2..<4].enumerated() {
                            self.fetchAlbumImagesRequest(index: index+2, trackInfo: trackInfo, group: group2)
                        }
                        for (index, trackInfo) in trackList[4..<6].enumerated() {
                            self.fetchAlbumImagesRequest(index: index+4, trackInfo: trackInfo, group: group3)
                        }
                        for (index, trackInfo) in trackList[6..<8].enumerated() {
                            self.fetchAlbumImagesRequest(index: index+6, trackInfo: trackInfo, group: group4)
                        }
                        for (index, trackInfo) in trackList[8..<10].enumerated() {
                            self.fetchAlbumImagesRequest(index: index+8, trackInfo: trackInfo, group: group5)
                        }
                        
                        group1.notify(queue: .main) {
                            print("Images 1-2 obtained")
                        }
                        group2.notify(queue: .main) {
                            print("Images 3-4 obtained")
                        }
                        group3.notify(queue: .main) {
                            print("Images 5-6 obtained")
                        }
                        group4.notify(queue: .main) {
                            print("Images 7-8 obtained")
                        }
                        group5.notify(queue: .main) {
                            print("Images 9-10 obtained")
                        }
                    }
                })
            }
        }
    }
}

struct MainHorizontalScrollView_Previews: PreviewProvider {
    static var previews: some View {
        MainHorizontalScrollView(isFavoritesView: false)
        .environmentObject(MostReadData())
        .previewDevice("iPad mini 4")
            .previewLayout(
                PreviewLayout.fixed(
                    width: 2732.0,
                    height: 2048.0
            )
        )
    }
}
