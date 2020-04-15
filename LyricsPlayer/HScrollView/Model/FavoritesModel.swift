//
//  FavoritesModel.swift
//  LyricsPlayer
//
//  Created by Felipe Girardi on 13/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import Foundation

struct FavoriteTrack: Hashable, Codable {
    static func == (lhs: FavoriteTrack, rhs: FavoriteTrack) -> Bool {
        return lhs.trackName == rhs.trackName
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(trackName)
    }
    
    let artistName: String?
    let trackName: String?
    let lyrics: String?
    
//    init(artistName: String, trackName: String, lyrics: String) {
//        self.artistName = artistName
//        self.trackName = trackName
//        self.lyrics = lyrics
//    }
//
//    required convenience init(coder aDecoder: NSCoder) {
//        let artistName = aDecoder.decodeObject(forKey: "artistName") as! String
//        let trackName = aDecoder.decodeObject(forKey: "trackName") as! String
//        let lyrics = aDecoder.decodeObject(forKey: "lyrics") as! String
//        self.init(artistName: artistName, trackName: trackName, lyrics: lyrics)
//    }
//
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(artistName, forKey: "artistName")
//        aCoder.encode(trackName, forKey: "trackName")
//        aCoder.encode(lyrics, forKey: "lyrics")
//    }
}
