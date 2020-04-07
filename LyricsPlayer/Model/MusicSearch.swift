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
struct Hit: Codable {
    let index, type: String?
    let result: Result?
}

// MARK: - Result
struct Result: Codable {
    let annotationCount: Int?
    let apiPath, fullTitle: String?
    let headerImageThumbnailURL, headerImageURL: String?
    let id, lyricsOwnerID: Int?
    let lyricsState: String?
    let path: String?
    let pyongsCount: Int?
    let songArtImageThumbnailURL, songArtImageURL: String?
    let stats: Stats?
    let title, titleWithFeatured: String?
    let url: String?
    let primaryArtist: PrimaryArtist?
}


// MARK: - PrimaryArtist
struct PrimaryArtist: Codable {
    let apiPath: String?
    let headerImageURL: String?
    let id: Int?
    let imageURL: String?
    let isMemeVerified, isVerified: Bool?
    let name: String?
    let url: String?
    let iq: Int?
}

// MARK: - Stats
struct Stats: Codable {
    let unreviewedAnnotations, concurrents: Int?
    let hot: Bool?
    let pageviews: Int?
}

