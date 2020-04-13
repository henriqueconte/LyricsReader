//
//  PlayerBarView.swift
//  LyricsPlayer
//
//  Created by Henrique Figueiredo Conte on 13/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import SwiftUI

struct PlayerBarView: View {
    var body: some View {
        
        HStack {
            artistView
            
            Spacer()
                .frame(width: UIScreen.main.bounds.width * 0.1)
            
            songControls
        }
        
    }
    
    
    var artistView: some View {
        HStack(spacing: 30) {
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
    
}

struct PlayerBarView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerBarView()
    }
}
