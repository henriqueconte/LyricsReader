//
//  PlayerBarView.swift
//  LyricsPlayer
//
//  Created by Henrique Figueiredo Conte on 13/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import SwiftUI

struct PlayerBarView: View {
    
    @State var songTime: Double = 0.0
    @State var songVolume: Double = 0.0
    
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
        .frame(width: UIScreen.main.bounds.width * 0.88, height: 90, alignment: .top)
        .padding(EdgeInsets(top: -15, leading: 0, bottom: 25, trailing: 0))
        
    }
    
    
    var artistView: some View {
        HStack(spacing: 20) {
            Image("blond")
                .resizable()
                .frame(width: 89, height: 89, alignment: .center)
                .border(Color(ColorsConstants.mainPink), width: 1)
                .cornerRadius(6)
                
            
            VStack(alignment: .leading, spacing: 5, content: {
                
                Text("Like a Stone")
                    .font(.system(size: 21, weight: .medium, design: .default))
                    .foregroundColor(Color(red: 229/255, green: 229/255, blue: 234/255))
                
                Text("Audioslave")
                    .font(.system(size: 13, weight: .light, design: .default))
                    .foregroundColor(Color(red: 209/255, green: 209/255, blue: 214/255))
                
                Image("heartIcon")
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
        PlayerBarView()
    }
}
