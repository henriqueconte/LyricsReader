//
//  LyricsFetch.swift
//  LyricsPlayer
//
//  Created by Felipe Girardi on 14/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import Foundation
import SwiftSoup

class HTMLParse: ObservableObject {
    var htmlString: String?
    var songString: String?
    
    func getHTMLString(urlString: String) {
        guard let myURL = URL(string: urlString) else {
            print("Error: \(urlString) doesn't seem to be a valid URL")
            return
        }

        do {
            let myHTMLString = try String(contentsOf: myURL, encoding: .ascii)
            //print("HTML : \(myHTMLString)")
            self.htmlString = myHTMLString
        } catch let error {
            print("Error: \(error)")
        }
    }
    
    func getSongLyrics(htmlString: String) -> String {
        do {
            let doc: Document = try SwiftSoup.parse(htmlString)
            //let text: String = try doc.body()!.text();
            let songLink: Element = try doc.select("p").first()!
            let songElements: Elements = try songLink.select("a")
            var songStringTemp: String = ""
            
            for link: Element in songElements.array() {
                let songVerse: String = try link.text()
                songStringTemp = songStringTemp + songVerse + "\n"
                //print(songText)
            }
            print(songStringTemp)
            return songStringTemp
            
//            let linkText: String = try link.text();
//            print(linkText)
//            self.songString = linkText
        } catch Exception.Error(_, let message) {
            print(message)
            return ""
        } catch {
            print("error")
            return ""
        }
    }
}
