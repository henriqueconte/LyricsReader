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
            
            //Spacer()
            //if(mostReadTracksFetched) {
                horizontalScrollCollectionView
            //}
        }
        .onAppear() {
            if(!self.isFavoritesView) {
                self.mostReadTracksData.fetchMostReadLyrics(completion: { (result) -> (Void) in
                    switch(result) {
                    case .failure(let error):
                        print("Error")
                        print(error.localizedDescription)
                    case .success(true):
                        print("Tracks obtained")
                        
//                        DispatchQueue.main.async {
//                            self.mostReadTracksData.albumImages.removeAll()
//                        }
//
//                        let semaphore = DispatchSemaphore(value: 1)
//
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//
//                        for track in self.mostReadTracksData.mostReadTracks {
//                            semaphore.wait()
//                            self.mostReadTracksData.fetchAlbumImages(artist: track.artistName ?? "", album: track.albumName ?? "", completion: { (result) -> (Void) in
//                                    switch(result) {
//                                    case "JSON Error":
//                                        print("JSON Error")
//                                        //print(error.localizedDescription)
//                                    case self.mostReadTracksData.tempImageString:
//                                        //print("Album images obtained")
//                                        let imageURL = URL(string: self.mostReadTracksData.tempImageString)!
//                                        let imageData = try? Data(contentsOf: imageURL)
//                                        let albumUIImage = UIImage(data: imageData ?? Data())
//                                        let albumImage = Image(uiImage: albumUIImage ?? UIImage())
//                                        DispatchQueue.main.async {
//                                            self.mostReadTracksData.albumImages.append(albumImage)
//                                        }
//
//                                    case "noAlbumImage":
//                                        //print("No album images found in API")
//                                        let noAlbumImage = Image("noAlbumImage")
//                                        DispatchQueue.main.async {
//                                            self.mostReadTracksData.albumImages.append(noAlbumImage)
//                                        }
//                                    default:
//                                        print("error")
//                                    }
//                                    semaphore.signal()
//                                })
//                            }
//                        }
//
                    case .success(false):
                        print("No tracks found in API")
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
