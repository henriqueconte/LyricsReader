//
//  BigTextView.swift
//  LyricsPlayer
//
//  Created by Henrique Figueiredo Conte on 07/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import SwiftUI

struct BigTextView: View {
    
    var artistName: String
    var trackName: String
    @Binding var songLyrics: String
    
    var bottomPadding: CGFloat = UIScreen.main.bounds.height / 16
    
    var body: some View {
        VStack {
            title
            lyrics
        }
    .padding(EdgeInsets(top: 0, leading: 0, bottom: bottomPadding, trailing: 0))
    }
    
    var title: some View {

        HStack {
            VStack {
                Text(trackName)
                .font(.system(size: 60))
                .bold()
                .lineLimit(1)
                
                Text(artistName)
                .font(.system(size: 30))
                
            }
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 60, leading: 50, bottom: 0, trailing: 50))
        
            
            // MARK:- Favoritar aqui Felipe!!!
            Button(action: {
                
            }) {
                Image("heartIcon")
            }
        }
        
    }
    
    var lyrics: some View {
        ScrollView(.vertical, showsIndicators: true, content: {
            lyricsText
        })
            .colorScheme(.dark)
            .font(.system(size: 50))
            //.padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
    }
    
    var lyricsText: some View {
        Text(songLyrics)
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
            .frame(minWidth: 0, maxWidth: 1000, minHeight: 0, maxHeight: .infinity)
            //.padding(EdgeInsets(top: 20, leading: 100, bottom: 0, trailing: 100))
    }
  
}

struct BigTextView_Previews: PreviewProvider {
    static var previews: some View {
        BigTextView(artistName: "Rick Astley", trackName: "Never Gonna Give You Up", songLyrics: .constant("We're no strangers to love\nYou know the rules and so do I\nA full commitment's what I'm thinking of\nYou wouldn't get this from any other guy\nI just wanna tell you how I'm feeling\nGotta make you understand\nNever gonna give you up\nNever gonna let you down\nNever gonna run around and desert you\nNever gonna make you cry\nNever gonna say goodbye\nNever gonna tell a lie and hurt you\nWe've known each other for so long\nYour heart's been aching but you're too shy to say it\nInside we both know what's been going on\nWe know the game and we're gonna play it\nAnd if you ask me how I'm feeling\nDon't tell me you're too blind to see\nNever gonna give you up\nNever gonna let you down\nNever gonna run around and desert you\nNever gonna make you cry\nNever gonna say goodbye\nNever gonna tell a lie and hurt you\nNever gonna give you up\nNever gonna let you down\nNever gonna run around and desert you\nNever gonna make you cry\nNever gonna say goodbye\nNever gonna tell a lie and hurt you\nNever gonna give, never gonna give\n(Give you up)\n(Ooh) Never gonna give, never gonna give\n(Give you up)\nWe've known each other for so long\nYour heart's been aching but you're too shy to say it\nInside we both know what's been going on\nWe know the game and we're gonna play it\nI just wanna tell you how I'm feeling\nGotta make you understand\nNever gonna give you up\nNever gonna let you down\nNever gonna run around and desert you\nNever gonna make you cry\nNever gonna say goodbye\nNever gonna tell a lie and hurt you\nNever gonna give you up\nNever gonna let you down\nNever gonna run around and desert you\nNever gonna make you cry\nNever gonna say goodbye\nNever gonna tell a lie and hurt you\nNever gonna give you up\nNever gonna let you down\nNever gonna run around and desert you\nNever gonna make you cry\n"))
            .padding()
    }
}
