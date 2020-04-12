//
//  MarqueeText.swift
//  LyricsPlayer
//
//  Created by Felipe Girardi on 07/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import SwiftUI

// Extension to (try to) make automatic text scroll (for horizontal scroll view).

extension String {

   func widthOfString(usingFont font: UIFont) -> CGFloat {
       let fontAttributes = [NSAttributedString.Key.font: font]
       let size = self.size(withAttributes: fontAttributes)
       return size.width
   }

   func heightOfString(usingFont font: UIFont) -> CGFloat {
       let fontAttributes = [NSAttributedString.Key.font: font]
       let size = self.size(withAttributes: fontAttributes)
       return size.height
   }

   func sizeOfString(usingFont font: UIFont) -> CGSize {
       let fontAttributes = [NSAttributedString.Key.font: font]
       return self.size(withAttributes: fontAttributes)
   }
}

struct MarqueeText : View {
@State var text = "Frank Ocean - Blond"
@State private var animate = false
private let animationOne = Animation.linear(duration: 2.5).delay(3.5).repeatForever(autoreverses: false)

var body : some View {
    let stringWidth = text.widthOfString(usingFont: UIFont.systemFont(ofSize: 15))
    return ZStack {
            GeometryReader { geometry in
                Text(self.text).lineLimit(1)
                    .font(.subheadline)
                    .offset(x: self.animate ? -stringWidth * 2 : 0)
                    .animation(self.animationOne)
                    .onAppear() {
                        if geometry.size.width < stringWidth {
                             self.animate = true
                        }
                }
                .fixedSize(horizontal: true, vertical: false)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                
                Text(self.text).lineLimit(1)
                    .font(.subheadline)
                    .offset(x: self.animate ? 0 : stringWidth * 2)
                    .animation(self.animationOne)
                    .fixedSize(horizontal: true, vertical: false)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                    //.hidden()
            }
        }
}

    struct MarqueeText_Previews: PreviewProvider {
        static var previews: some View {
            MarqueeText()
            .previewDevice("iPad mini 4")
                .previewLayout(
                    PreviewLayout.fixed(
                        width: 2732.0,
                        height: 2048.0
                )
            )
        }
    }

}
