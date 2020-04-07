//
//  LyricsView.swift
//  LyricsPlayer
//
//  Created by Henrique Figueiredo Conte on 07/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import SwiftUI

struct LyricsView: View {
    
    var switchButtonsTopInset = -UIScreen.main.bounds.height / 11
    
    var body: some View {
        VStack() {
            BigTextView()
            switchButtons
                .padding(EdgeInsets(top: switchButtonsTopInset, leading: 0, bottom: 0, trailing: UIScreen.main.bounds.width / 1.3))
        }
        .background(Color.blue)
        .edgesIgnoringSafeArea(.all)
    }
    
    var switchButtons: some View {
        
        HStack {
            Image("smallTextDisabledIcon")
            Image("bigTextEnabledIcon")
        }
            
    }
    
}

struct LyricsView_Previews: PreviewProvider {
    static var previews: some View {
        LyricsView()
    }
}
