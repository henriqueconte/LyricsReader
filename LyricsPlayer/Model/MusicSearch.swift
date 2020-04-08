//
//  Music.swift
//  LyricsPlayer
//
//  Created by Guilherme Piccoli on 07/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import Foundation

import Foundation

// MARK: - MusicSearch
struct MusicSearch: Codable {
    let meta: Meta?
    let response: Response?
}

// MARK: - Meta
struct Meta: Codable {
    let status: Int?
}

// MARK: - Response
struct Response: Codable {
    let hits: [Hit]?
}

// MARK: - Hit
struct Hit: Codable, Hashable {
    let index, type: String?
    let result: Result?
}

struct MusicHit: Codable, Hashable, Identifiable {
    let id: UUID = UUID()
    let details: Result?
}

// MARK: - Result
struct Result: Codable, Hashable, Identifiable {
    let annotation_count: Int?
    let api_path, full_title: String?
    let header_image_thumbnail_url, header_image_url: String?
    let id, lyrics_owner_id: Int?
    let lyrics_state: String?
    let path: String?
    let pyongs_count: Int?
    let song_art_image_thumbnail_url, song_art_image_url: String?
    let title, title_with_featured: String?
    let url: String?
    let primary_artist: PrimaryArtist?
}


// MARK: - PrimaryArtist
struct PrimaryArtist: Codable, Hashable, Identifiable {
    let apiPath: String?
    let headerImageURL: String?
    let id: Int?
    let imageURL: String?
    let isMemeVerified, isVerified: Bool?
    let name: String?
    let url: String?
    let iq: Int?
    
    enum CodingKeys: String, CodingKey {
        case apiPath = "api_path"
        case headerImageURL = "header_image_url"
        case id
        case imageURL = "image_url"
        case isMemeVerified = "is_meme_verified"
        case isVerified = "is_verified"
        case name, url, iq
    }
}



