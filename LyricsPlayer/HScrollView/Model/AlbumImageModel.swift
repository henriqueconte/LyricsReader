//
//  AlbumImageModel.swift
//  LyricsPlayer
//
//  Created by Felipe Girardi on 11/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import Foundation

// MARK: - AlbumImage
//struct AlbumImage: Codable {
//    let album: Album?
//}

// MARK: - Album
struct Album: Codable {
//    let name, artist: String?
//    let url: String?
    let image: [ImageInfo]?
//    let listeners, playcount: String?
//    let tracks: Tracks?
//    let tags: Tags?
//    let wiki: Wiki?
}

// MARK: - Image
struct ImageInfo: Codable {
    let text: String?
    let size: String?

    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case size
    }
}

// MARK: - Tags
//struct Tags: Codable {
//    let tag: [JSONAny]?
//}
//
// MARK: - Tracks
//struct Tracks: Codable {
//    let track: [JSONAny]?
//}
//
// MARK: - Wiki
//struct Wiki: Codable {
//    let published, summary, content: String?
//}
