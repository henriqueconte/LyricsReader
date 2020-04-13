//
//  LyricsView.swift
//  LyricsPlayer
//
//  Created by Henrique Figueiredo Conte on 07/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import SwiftUI

struct LyricsView: View {
    
    @State var text = ""
    @State private var isBigTextActive: Bool = true
    
    var switchButtonsTopInset = -UIScreen.main.bounds.height * 0.091
    var switchButtonsTrailingInset = UIScreen.main.bounds.width * 0.8
    
    var gradientViewTopInset = -UIScreen.main.bounds.height * 0.15
    
    
    var body: some View {
        VStack() {
            
            if self.isBigTextActive {
                BigTextView()
            }
            else {
                SmallTextView()
            }
            
            gradientView
                .padding(EdgeInsets(top: gradientViewTopInset, leading: 0, bottom: 0, trailing:0))
            
            switchButtons
            .padding(EdgeInsets(top: switchButtonsTopInset, leading: 0, bottom: 0, trailing: switchButtonsTrailingInset))
          
            PlayerBarView()
                .frame(width: UIScreen.main.bounds.width, height: 170, alignment: .center)
        }
        .background(Color(ColorsConstants.darkGray))
        .edgesIgnoringSafeArea(.all)
    }
    
    var switchButtons: some View {
        
        HStack {
            
            Button(action: {
                self.isBigTextActive = true
            }) {
                
                if isBigTextActive {
                    Image("bigTextEnabledIcon")
                }
                else {
                    Image("bigTextDisabledIcon")
                }
            }
            
            Button(action: {
                self.isBigTextActive = false
            }) {
                if isBigTextActive {
                    Image("smallTextDisabledIcon")
                }
                else {
                    Image("smallTextEnabledIcon")
                }
                
            }
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
