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
            self.htmlString = myHTMLString
        } catch let error {
            print("Error: \(error)")
        }
    }
    
    func getSongLyrics(htmlString: String) -> String {
        do {
            let doc: Document = try SwiftSoup.parse(htmlString)
            let songLink: Element = try doc.select("p").first()!
            let newHtmlString: String = try songLink.html()
            let newDoc: Document = try SwiftSoup.parse(newHtmlString)
            
            newDoc.outputSettings().prettyPrint(pretty: false)
            try newDoc.select("br").append("\n");
            let s: String = try newDoc.html().replacingOccurrences(of: "\\\\n", with: "\n");
            let s2: String = try SwiftSoup.clean(s, "", Whitelist.none(), Document("").outputSettings().prettyPrint(pretty: false)) ?? ""
            
            //print(s2)
            return s2

        } catch Exception.Error(_, let message) {
            print(message)
            return ""
        } catch {
            print("error")
            return ""
        }
    }
}
