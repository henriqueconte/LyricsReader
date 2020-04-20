//
//  PlayerBarView.swift
//  LyricsPlayer
//
//  Created by Henrique Figueiredo Conte on 13/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import SwiftUI

struct PlayerBarView: View {
    
    var artistName: String
    var trackName: String
    var songLyrics: String
    @State var favoritedTracks: [FavoriteTrack] = []
    @State var favoritedTrackIndex: Int = 0
    @State var isCurrentSongFavorited: Bool = false
    @State var songTime: Double = 0.0
    @State var songVolume: Double = 0.8
    
    var body: some View {
        
        HStack {
            artistView
            
            Spacer()
                .frame(width: UIScreen.main.bounds.width * 0.07)
            
            songControls
            
            Spacer()
                .frame(width: UIScreen.main.bounds.width * 0.05)
            
            songTimeSlider
            
            Spacer()
                .frame(width: UIScreen.main.bounds.width * 0.05)
            
            songVolumeSlider
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 90, alignment: .top)
        .padding(EdgeInsets(top: -15, leading: 0, bottom: 25, trailing: 0))
        .onAppear() {
            do {
                let defaults = UserDefaults.standard
                if let storedObject = defaults.object(forKey: "favoriteTracks") as? Data {
                    self.favoritedTracks = try PropertyListDecoder().decode([FavoriteTrack].self, from: storedObject)
                }
                
                for (index, favoritedTrack) in self.favoritedTracks.enumerated() {
                    if(favoritedTrack.artistName == self.artistName && favoritedTrack.trackName == self.trackName) {
                        DispatchQueue.main.async {
                            self.isCurrentSongFavorited = true
                        }
                        self.favoritedTrackIndex = index
                    }
                }
            } catch {
                print("Failed getting favorite tracks from UserDefaults")
            }
        }
    }
    
    var artistView: some View {
        HStack(spacing: 20) {
            Image("blond")
                .resizable()
                .frame(width: 89, height: 89, alignment: .center)
                .border(Color(ColorsConstants.mainPink), width: 1)
                .cornerRadius(6)
                
            
            VStack(alignment: .leading, spacing: 5, content: {
                
                Text(trackName)
                    .font(.system(size: 21, weight: .medium, design: .default))
                    .foregroundColor(Color(red: 229/255, green: 229/255, blue: 234/255))
                
                Text(artistName)
                    .font(.system(size: 13, weight: .light, design: .default))
                    .foregroundColor(Color(red: 209/255, green: 209/255, blue: 214/255))
                
                Button(action: {
                    do {
                        if(!self.isCurrentSongFavorited) {
                            let newFavoriteTrack: FavoriteTrack = FavoriteTrack(artistName: self.artistName, trackName: self.trackName, lyrics: self.songLyrics)
                            self.favoritedTracks.append(newFavoriteTrack)
                            self.favoritedTrackIndex = self.favoritedTracks.count - 1
                        } else {
                            self.favoritedTracks.remove(at: self.favoritedTrackIndex)
                        }
                        
                        self.isCurrentSongFavorited = !self.isCurrentSongFavorited
                        UserDefaults.standard.set(try PropertyListEncoder().encode(self.favoritedTracks), forKey: "favoriteTracks")
                    } catch {
                        print("Failed saving favorite tracks to UserDefaults")
                    }
                }) {
                    Image(isCurrentSongFavorited ? "heartIcon2" : "heartIcon")
                        .renderingMode(.original)
                }
            })
            .frame(width: UIScreen.main.bounds.width * 0.12)
            
        }
    }
    
    var songControls: some View {
        HStack(spacing: 34) {
            Button(action: {
                
            }) {
                Image("backSongIcon")
            }
            
            Button(action: {
                
            }) {
                Image("pauseSongIcon")
            }
            
            Button(action: {
                
            }) {
                Image("skipSongIcon")
            }
        }
    }
    
    var songTimeSlider: some View {
        HStack {
            Text("4:23")
                .foregroundColor(Color(red: 142/255, green: 142/255, blue: 147/255))
                .frame(width: 50)
            
            Spacer()
                .frame(width: 10)
            
            Slider(value: $songTime)
                .frame(width: UIScreen.main.bounds.width * 0.26)
                .accentColor(Color.white)
                .colorMultiply(Color(ColorsConstants.mainPink))
        }
    }
    
    var songVolumeSlider: some View {
        HStack(spacing: 0) {
            Image("volumeIcon")
                .background(Color(red: 72/255, green: 72/255, blue: 74/255)
                    .padding(EdgeInsets(top: -5, leading: -5, bottom: -5, trailing: -5))
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color(red: 72/255, green: 72/255, blue: 74/255), lineWidth: 5))
            )
                
            
            Slider(value: $songVolume)
                .frame(width: UIScreen.main.bounds.width * 0.12)
                .accentColor(Color.white)
                .colorMultiply(Color(ColorsConstants.mainPink))
        }
    }
}

struct PlayerBarView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerBarView(artistName: "Audioslave", trackName: "Like a Stone", songLyrics: "Lyrics")
    }
}
