//
//  LyricsScrollView.swift
//  LyricsPlayer
//
//  Created by Henrique Figueiredo Conte on 08/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import SwiftUI
//
struct LyricsScrollViews<Content>: View where Content: View {

    var content: () -> Content

    var body: some View {

        GeometryReader { outerGeometry in
            self.content()
            .frame(height: outerGeometry.size.height)
            .clipped()
        }

    }
}

struct LyricsScrollView_Previews: PreviewProvider {
    static var previews: some View {
        LyricsScrollView()
    }
}

struct LyricsScrollView: UIViewRepresentable {
   // @Binding var text: String
    
    
    
    func makeUIView(context: Context) -> UIScrollView {
        return UIScrollView()
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        uiView.indicatorStyle = .white
    }
}


struct LyricsText: UIViewRepresentable {
    @Binding var text: String
    
    func makeUIView(context: Context) -> UILabel {
        
        let textView = UILabel(frame: CGRect(x: 50, y: 50, width: 300, height: 300))
        
        textView.text = self.text
        textView.font = UIFont(name: "", size: 40)
//        textView.backgroundColor = .red
//        textView.textColor = .white
        textView.tintColor = .white
        textView.isHidden = false
        
        return textView
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = text
        uiView.font = UIFont(name: "", size: 40)
        uiView.textColor = ColorsConstants.mainWhite
    }
}
