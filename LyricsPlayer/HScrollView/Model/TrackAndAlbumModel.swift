//
//  TrackAndAlbumModel.swift
//  LyricsPlayer
//
//  Created by Felipe Girardi on 13/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import Foundation
import SwiftUI

//MARK: - TrackAndAlbum
struct TrackAndAlbum: Hashable {
    static func == (lhs: TrackAndAlbum, rhs: TrackAndAlbum) -> Bool {
        return lhs.track?.trackID == rhs.track?.trackID
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(track?.trackID)
    }
    
    let track: Track?
    let album: Image?
}
