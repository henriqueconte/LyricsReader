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
    
    var body: some View {
        Button(action: {
            self.spotifyConnection.connectMusic()
            self.currentTrackName = self.spotifyConnection.getCurrentTrackName()
        }) {
            Text("Now playing: " + currentTrackName)
        }
        .onAppear(perform: {
            self.currentTrackName = self.spotifyConnection.getCurrentTrackName()
        })
    }
}

struct SpotifyTestView_Previews: PreviewProvider {
    static var previews: some View {
        SpotifyTestView()
    }
}
