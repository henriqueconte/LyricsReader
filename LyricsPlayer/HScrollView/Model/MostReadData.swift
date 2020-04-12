//
//  MostReadData.swift
//  LyricsPlayer
//
//  Created by Felipe Girardi on 09/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class MostReadData: ObservableObject {
    @Published var mostReadTracks: [Track] = [Track(trackID: 0, trackName: "Loading...", albumName: "", artistName: "")]
    @Published var albumImages: [Image] = [Image("noAlbumImage")]
    @Published var tracksAndAlbums: [TrackAndAlbum] = [TrackAndAlbum(track: Track(trackID: 0, trackName: "Loading...", albumName: "", artistName: ""), album: Image("noAlbumImage"))]
    var tempImageString: String = ""
    
    func fetchMostReadLyrics(completion: @escaping (Result<Bool, Error>) -> (Void)) {
        
        let apiKey: String = "35af8ec8c571e8ab3af3f3262dcce445"
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.musixmatch.com"
        components.path = "/ws/1.1/chart.tracks.get"
        components.queryItems = [URLQueryItem(name: "format", value: "json"),
                                 URLQueryItem(name: "callback", value: "callback"),
                                 URLQueryItem(name: "apikey", value: apiKey)
        ]

        let request = NSMutableURLRequest(url: components.url!,
                                               cachePolicy: .useProtocolCachePolicy,
                                               timeoutInterval: 10.0)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error.debugDescription)
            }
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    do {
                        guard let data = data,
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any],
                        let message = json["message"] as? [String : Any],
                        let body = message["body"] as? [String : Any],
                        let trackList = body["track_list"] as? [[String : Any]]
                        else {
                           let resultFailure: Result<Bool, Error> = .success(false)
                           completion(resultFailure)
                           return
                        }
                        do {
                            let jsonData = try JSONSerialization.data(withJSONObject: trackList, options: [])
                            do {
                                let trackData = try JSONDecoder().decode([TrackList].self, from: jsonData)
                                
                                let semaphore = DispatchSemaphore(value: 1)
                                var albumImagesArray: [Image] = []
    
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
    
                                for track_Data in trackData {
                                    semaphore.wait()
                                    self.fetchAlbumImages(artist: track_Data.track?.artistName ?? "", album: track_Data.track?.albumName ?? "", completion: { (result) -> (Void) in
                                            switch(result) {
                                            case "JSON Error":
                                                print("JSON Error")
                                                //print(error.localizedDescription)
                                            case self.tempImageString:
                                                //print("Album images obtained")
                                                let imageURL = URL(string: self.tempImageString)!
                                                let imageData = try? Data(contentsOf: imageURL)
                                                let albumUIImage = UIImage(data: imageData ?? Data())
                                                let albumImage = Image(uiImage: albumUIImage ?? UIImage())
                                                //DispatchQueue.main.async {
                                                    albumImagesArray.append(albumImage)
                                                //}
        
                                            case "noAlbumImage":
                                                //print("No album images found in API")
                                                let noAlbumImage = Image("noAlbumImage")
                                                //DispatchQueue.main.async {
                                                    albumImagesArray.append(noAlbumImage)
                                                //}
                                            default:
                                                print("error")
                                            }
                                            semaphore.signal()
                                        })
                                    }
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                            self.tracksAndAlbums.removeAll()
                                            //self.albumImages.removeAll()
                                            //self.albumImages = albumImagesArray
                                        for (index, track_Data) in trackData.enumerated() {
                                                if let track = track_Data.track {
                                                    self.tracksAndAlbums.append(TrackAndAlbum(track: track, album: albumImagesArray[index]))
                                                }
                                            }
                                            //print(self._mostReadTracks)
                                            let resultSucess: Result<Bool, Error> = .success(true)
                                            completion(resultSucess)
                                    }
                                }
                                
                            } catch {
                                print("JSON Decoding Fail")
                                let resultFailure: Result<Bool, Error> = .failure(error)
                                completion(resultFailure)
                            }
                            
                            
                        } catch {
                            print("JSONSerialization data error")
                            let resultFailure: Result<Bool, Error> = .failure(error)
                            completion(resultFailure)
                        }
                        
                    } catch {
                         print("JSONSerialization jsonObject error:", error)
                         let resultFailure: Result<Bool, Error> = .failure(error)
                         completion(resultFailure)
                     }
                }
            }
        })
        dataTask.resume()
    }
    
    func fetchAlbumImages(artist: String, album: String, completion: @escaping (String) -> (Void)) {
        let apiKey: String = "1d18e2989f42b0c55a75dd91da151a8a"

        var components = URLComponents()
        components.scheme = "https"
        components.host = "ws.audioscrobbler.com"
        components.path = "/2.0"
        components.queryItems = [URLQueryItem(name: "method", value: "album.getinfo"),
                                 URLQueryItem(name: "api_key", value: apiKey),
                                 URLQueryItem(name: "artist", value: artist),
                                 URLQueryItem(name: "album", value: album),
                                 URLQueryItem(name: "format", value: "json")

        ]

        let request = NSMutableURLRequest(url: components.url!,
                                               cachePolicy: .useProtocolCachePolicy,
                                               timeoutInterval: 10.0)
        request.httpMethod = "GET"

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error.debugDescription)
            }
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    do {
                        guard let data = data,
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any],
                        let album = json["album"] as? [String : Any],
                        let imageInfo = album["image"] as? [[String : Any]],
                        let imageURLString = imageInfo[5]["#text"] as? String
                        else {
                            //DispatchQueue.main.async {
                                //self.albumImageStrings.append("noAlbumImage")
                            //}

                            //let resultFailure: Result<String, Error> = .success("noAlbumImage")
                            completion("noAlbumImage")
                            return
                        }

                        //DispatchQueue.main.async {
                            self.tempImageString = imageURLString
                        //}

                            //let resultSucess: Result<String, Error> = .success(imageURLString)
                            completion(imageURLString)
                        //}
//                        do {
//                            let jsonData = try JSONSerialization.data(withJSONObject: trackList, options: [])
//                            do {
//                                let trackData = try JSONDecoder().decode([TrackList].self, from: jsonData)
//
//                                DispatchQueue.main.async {
//                                    self.mostReadTracks.removeAll()
//                                    for trackData in trackData {
//                                        if let track = trackData.track {
//                                            self.mostReadTracks.append(track)
//                                        }
//                                    }
//                                    //print(self._mostReadTracks)
//
//                                    let resultSucess: Result<Bool, Error> = .success(true)
//                                    completion(resultSucess)
//                                }
//                            } catch {
//                                print("JSON Decoding Fail")
//                                let resultFailure: Result<Bool, Error> = .failure(error)
//                                completion(resultFailure)
//                            }
//
//
//                        } catch {
//                            print("JSONSerialization data error")
//                            let resultFailure: Result<Bool, Error> = .failure(error)
//                            completion(resultFailure)
//                        }

                    } catch {
                         print("JSONSerialization jsonObject error:", error)
                         //let resultFailure: Result<String, Error> = .failure(error)
                         completion("JSON Error")
                     }
                }
            }
        })
        dataTask.resume()
    }
    
}
