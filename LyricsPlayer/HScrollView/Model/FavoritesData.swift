//
//  FavoritesData.swift
//  LyricsPlayer
//
//  Created by Felipe Girardi on 13/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class FavoritesData: ObservableObject {
    @Published var favoriteTracks: [TrackAndAlbum] = [TrackAndAlbum(track: Track(trackID: 0, trackName: "Loading...", albumName: "", artistName: ""), album: Image("noAlbumImage"))]
}
