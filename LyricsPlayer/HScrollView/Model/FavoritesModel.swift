//
//  FavoritesModel.swift
//  LyricsPlayer
//
//  Created by Felipe Girardi on 13/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import Foundation

struct FavoriteTracks: Hashable {
    static func == (lhs: FavoriteTracks, rhs: FavoriteTracks) -> Bool {
        return lhs.trackAndAlbum?.track?.trackID == rhs.trackAndAlbum?.track?.trackID
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(trackAndAlbum?.track?.trackID)
    }
    
    let trackAndAlbum: TrackAndAlbum?
    let lyrics: String
}
