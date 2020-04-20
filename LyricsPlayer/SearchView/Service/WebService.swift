//
//  File.swift
//  LyricsPlayer
//
//  Created by Guilherme Piccoli on 07/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import SwiftUI
import Combine

final class WebService: ObservableObject {
    @Published var currentSearc: MusicSearch? = nil
    
    @Published var newWordQueryFinished = false
    
    //@Published var lyrics: String = ""
    
    func fetchSearchMusicData(musicName: String, completion: @escaping (MusicSearch?) -> (Void)) {
        
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.genius.com"
        components.path = "/search"
        components.queryItems = [URLQueryItem(name: "q", value: musicName),
                                 URLQueryItem(name: "access_token", value: "SZXGwSbkKToXjK1myV2jF77ryc3M43Hh4b2mamXP9Rdi5OPkaLh4Ad1kr3YsGH3R")
        ]
        

        let request = NSMutableURLRequest(url: components.url!,
                                               cachePolicy: .useProtocolCachePolicy,
                                               timeoutInterval: 10.0)
        request.httpMethod = "GET"
        

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let error = error
            else {
                let musicSearch = try? JSONDecoder().decode(MusicSearch.self, from: data!)
                completion(musicSearch)
                return
            }
            print(error.localizedDescription)
            completion(nil)
            return
        })
        dataTask.resume()
    }
}
