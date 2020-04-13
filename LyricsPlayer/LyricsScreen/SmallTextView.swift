//
//  SmallTextView.swift
//  LyricsPlayer
//
//  Created by Henrique Figueiredo Conte on 08/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import SwiftUI

struct SmallTextView: View {
    
    var bottomPadding: CGFloat = UIScreen.main.bounds.height / 16

    @State var text: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    
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
                Text("Rockin' in The Free World")
                .font(.system(size: 35))
                .bold()
                .lineLimit(1)
                
                Text("Neil Young")
                .font(.system(size: 21))
                
            }
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 60, leading: 50, bottom: 0, trailing: 50))
            
        }
        
    }
    
    var lyrics: some View {
        ScrollView(.vertical, showsIndicators: true, content: {
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 20, leading: 100, bottom: 0, trailing: 100))
        })
            .font(.system(size: 23))
            .colorScheme(.dark)
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
    }
}

struct SmallTextView_Previews: PreviewProvider {
    static var previews: some View {
        SmallTextView()
    }
}
