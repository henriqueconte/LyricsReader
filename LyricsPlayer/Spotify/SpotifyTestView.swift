//
//  SpotifyTestView.swift
//  LyricsPlayer
//
//  Created by Henrique Figueiredo Conte on 15/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import SwiftUI

struct SpotifyTestView: View {
    
    let spotifyConnection = SpotifyConnection()
    @State var currentTrackName: String = "Track"
    @State var songTime: Double = 0.0
    @State var songVolume: Double = 0.0
    
    var body: some View {
        
        HStack {
            artistView

            Spacer()
                .frame(width: UIScreen.main.bounds.width * 0.06)

            songControls

            Spacer()
                .frame(width: UIScreen.main.bounds.width * 0.05)

            songTimeSlider

            Spacer()
                .frame(width: UIScreen.main.bounds.width * 0.05)

            songVolumeSlider
        }
        .frame(width: UIScreen.main.bounds.width * 0.88, height: 90, alignment: .top)
        .padding(EdgeInsets(top: -15, leading: 0, bottom: 25, trailing: 0))

    }
    
    
    var artistView: some View {
        HStack(spacing: 20) {
            Image("blond")
                .resizable()
                .frame(width: 59, height: 59, alignment: .center)
                .border(Color(ColorsConstants.mainPink), width: 1)
                .cornerRadius(4)
                
            
            VStack(alignment: .leading, spacing: 5, content: {
                
                Text("Like a Stone")
                    .font(.system(size: 17, weight: .medium, design: .default))
                    .foregroundColor(Color(red: 229/255, green: 229/255, blue: 234/255))
                
                Text("Audioslave")
                    .font(.system(size: 9, weight: .light, design: .default))
                    .foregroundColor(Color(red: 209/255, green: 209/255, blue: 214/255))
                
                Image("heartIcon")
            })
            .frame(width: UIScreen.main.bounds.width * 0.12)
            
        }
    }
    
    var songControls: some View {
        HStack(spacing: 28) {
            Button(action: {
                
            }) {
                Image("backSongIcon")
            }
            
            Button(action: {
                self.spotifyConnection.connectMusic()
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
                .frame(width: UIScreen.main.bounds.width * 0.22)
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
                .frame(width: UIScreen.main.bounds.width * 0.1)
                .accentColor(Color.white)
                .colorMultiply(Color(ColorsConstants.mainPink))
        }
    }
}

struct SpotifyTestView_Previews: PreviewProvider {
    static var previews: some View {
        SpotifyTestView()
    }
}
