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
    @EnvironmentObject var favoritesData: FavoritesData
    var isFavoritesView: Bool
    @State var mostReadTracksFetched: Bool = false
    @State var albumImagesFetched: Bool = false
    
    func getFavoriteTracks() {
        do {
            let defaults = UserDefaults.standard
            var storedTracks: [FavoriteTrack]
            if let storedObject = defaults.object(forKey: "favoriteTracks") as? Data {
                storedTracks = try PropertyListDecoder().decode([FavoriteTrack].self, from: storedObject)
            } else {
                storedTracks = []
            }
            
            DispatchQueue.main.async {
                self.favoritesData.favoriteTracks = storedTracks
            }
        } catch {
            print("Could not get favorite tracks from UserDefaults")
        }
    }
    
    func fetchAlbumImagesRequest(index: Int, trackInfo: TrackList, group: DispatchGroup) {
        group.enter()
        self.mostReadTracksData.fetchAlbumImages(artist: trackInfo.track?.artistName ?? "", album: trackInfo.track?.albumName ?? "", completion: { (result) -> (Void) in
        
            var albumImage: Image = Image("darkSideOfTheMoon")
        
            switch(result) {
            case "JSON Error":
                print("JSON Error")
            case self.mostReadTracksData.tempImageString:
                if(self.mostReadTracksData.tempImageString != "") {
                    guard let imageURL = URL(string: self.mostReadTracksData.tempImageString) else { return }
                    guard let imageData = try? Data(contentsOf: imageURL) else { return }
                    let albumUIImage = UIImage(data: imageData)
                    albumImage = Image(uiImage: albumUIImage ?? UIImage())
                }
            case "noAlbumImage":
                break
            default:
                print("error")
            }
            
            DispatchQueue.main.async {
                self.mostReadTracksData.tracksAndAlbums[index] = TrackAndAlbum(track: trackInfo.track ?? Track(trackID: 0, trackName: "", albumName: "", artistName: ""), album: albumImage)
                group.leave()
            }
        })
    }
    
    // - MARK: I had to duplicate the code for the horizontalScrollCollectionView for now, will refactor when I have time
    
    var mostReadHorizontalScrollCollectionCell: some View {
        ForEach(self.mostReadTracksData.tracksAndAlbums, id: \.self) { trackAndAlbum in
            NavigationLink(destination: LyricsView(artistName: trackAndAlbum.track?.artistName ?? "", trackName: trackAndAlbum.track?.trackName ?? "")
                .environmentObject(WebService())
                .environmentObject(HTMLParse())) {
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
                     
                    // For moving text (not functional)
    //                .overlay(MarqueeText(text: self.artistNames[index] + " - " + self.songNames[index])
    //                .font(.system(size: 12))
    //                     .padding(4))
                    
                    .padding(7.5)
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
    
    var favoritesHorizontalScrollCollectionCell: some View {
        ForEach(self.favoritesData.favoriteTracks, id: \.self) { favoriteTrack in
            NavigationLink(destination: LyricsView(artistName: favoriteTrack.artistName ?? "", trackName: favoriteTrack.trackName ?? "")
                .environmentObject(WebService())
                .environmentObject(HTMLParse())) {
                Image("darkSideOfTheMoon")
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
                    
                    .overlay(Text(favoriteTrack.trackName ?? "")
                        .font(.system(size: 12))
                        .foregroundColor(Color.white)
                        .lineLimit(1)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                        .padding(8)
                    )
                     
                    // For moving text (not functional)
    //                .overlay(MarqueeText(text: self.artistNames[index] + " - " + self.songNames[index])
    //                .font(.system(size: 12))
    //                     .padding(4))
                    
                    .padding(7.5)
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
    
    var mostReadHorizontalScrollCollectionView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
             HStack {
                mostReadHorizontalScrollCollectionCell
             }
        }
    }
    
    var favoritesHorizontalScrollCollectionView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
             HStack {
                favoritesHorizontalScrollCollectionCell
             }
        }
    }
    
    var body: some View {
        VStack {
            Text(isFavoritesView ? "Favorites" : "Most Read")
                .font(.system(size: 21))
                .bold()
                .foregroundColor(Color(red: 255/255, green: 55/255, blue: 95/255))
            
            if(self.isFavoritesView) {
                favoritesHorizontalScrollCollectionView
            } else {
                if(self.mostReadTracksFetched) {
                    mostReadHorizontalScrollCollectionView
                } else {
                    mostReadHorizontalScrollCollectionView.hidden()
                }
            }
                
        }
        .onAppear() {
            self.getFavoriteTracks()
            
            if(!self.isFavoritesView && !self.mostReadTracksFetched && !self.albumImagesFetched) {
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
                        
                        for (index, trackInfo) in trackList[0..<2].enumerated() {
                            self.fetchAlbumImagesRequest(index: index, trackInfo: trackInfo, group: group1)
                        }
                        for (index, trackInfo) in trackList[2..<4].enumerated() {
                            self.fetchAlbumImagesRequest(index: index+2, trackInfo: trackInfo, group: group1)
                        }
                        for (index, trackInfo) in trackList[4..<6].enumerated() {
                            self.fetchAlbumImagesRequest(index: index+4, trackInfo: trackInfo, group: group1)
                        }
                        for (index, trackInfo) in trackList[6..<8].enumerated() {
                            self.fetchAlbumImagesRequest(index: index+6, trackInfo: trackInfo, group: group1)
                        }
                        for (index, trackInfo) in trackList[8..<10].enumerated() {
                            self.fetchAlbumImagesRequest(index: index+8, trackInfo: trackInfo, group: group1)
                        }
                        
                        group1.notify(queue: .main) {
                            print("Images obtained")
                            self.albumImagesFetched = true
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
        .environmentObject(FavoritesData())
        .previewDevice("iPad mini 4")
            .previewLayout(
                PreviewLayout.fixed(
                    width: 2732.0,
                    height: 2048.0
            )
        )
    }
}
