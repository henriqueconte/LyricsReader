//
//  ContentView.swift
//  LyricsPlayer
//
//  Created by Henrique Figueiredo Conte on 06/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    @EnvironmentObject var webservice: WebService

    var body: some View {
        HStack {
            Text("Hello, World!")
            Button(action: {
                self.webservice.fetchSearchMusicData(musicName: "Love Yourself") { (result) -> (Void) in
                    print("Main", result)
                }
            }, label: {
                Text("Confirm")
                    .fontWeight(.semibold)
                    .font(Font.custom("Georgia", size: 20))
                    .foregroundColor(Color.red)
                })
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(WebService())
    }
}
