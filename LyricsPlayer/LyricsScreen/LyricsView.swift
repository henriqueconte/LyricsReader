//
//  LyricsView.swift
//  LyricsPlayer
//
//  Created by Henrique Figueiredo Conte on 07/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import SwiftUI

struct LyricsView: View {
    
    var switchButtonsTopInset = -UIScreen.main.bounds.height * 0.091
    var switchButtonsTrailingInset = UIScreen.main.bounds.width * 1.1
    
    var gradientViewTopInset = -UIScreen.main.bounds.height * 0.145
    
    
    var body: some View {
        VStack() {
            BigTextView()
            //SmallTextView()
            gradientView
                .padding(EdgeInsets(top: gradientViewTopInset, leading: 0, bottom: 0, trailing:0))
            
            switchButtons
                .padding(EdgeInsets(top: switchButtonsTopInset, leading: 0, bottom: 0, trailing: switchButtonsTrailingInset))
            
        }
        .background(Color(ColorsConstants.darkGray))
        .edgesIgnoringSafeArea(.all)
    }
    
    var switchButtons: some View {
        
        HStack {
            Image("smallTextDisabledIcon")
            Image("bigTextEnabledIcon")
        }
    }
    
    var gradientView: some View {
        
        VStack(spacing: 0) {
            Text("Hello World!")
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.14, alignment: .center)
                .foregroundColor(.clear)
                .background(LinearGradient(gradient: Gradient(colors: [Color(UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 0.1)), Color(ColorsConstants.darkGray)]), startPoint: .top, endPoint: .bottom))
            
            Text("Hello World!")
                .frame(width: UIScreen.main.bounds.width * 0.85, height: 1, alignment: .center)
                .foregroundColor(.clear)
                .background(Color(ColorsConstants.lightGray))
        }
    }
    
}

struct LyricsView_Previews: PreviewProvider {
    static var previews: some View {
        LyricsView()
    }
}
