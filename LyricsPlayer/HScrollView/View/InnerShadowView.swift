//
//  InnerShadowView.swift
//  LyricsPlayer
//
//  Created by Felipe Girardi on 08/04/20.
//  Copyright © 2020 Henrique Figueiredo Conte. All rights reserved.
//

import SwiftUI

// View to make inner shadow for horizontal scroll image

extension View {
    func innerShadow(color: Color, radius: CGFloat = 0.1) -> some View {
        modifier(InnerShadow(color: color, radius: min(max(0, radius), 1)))
    }
}

private struct InnerShadow: ViewModifier {
    var color: Color = .black
    var radius: CGFloat = 0.1

    private var colors: [Color] {
        [color.opacity(0.75), color.opacity(0.0), .clear]
    }

    func body(content: Content) -> some View {
        GeometryReader { geo in
            content
                .overlay(LinearGradient(gradient: Gradient(colors: self.colors), startPoint: .top, endPoint: .bottom)
                    .frame(height: self.radius * self.minSide(geo)),
                         alignment: .top)
                    .cornerRadius(5)
//                .overlay(LinearGradient(gradient: Gradient(colors: self.colors), startPoint: .bottom, endPoint: .top)
//                    .frame(height: self.radius * self.minSide(geo)),
//                         alignment: .bottom)
//                .overlay(LinearGradient(gradient: Gradient(colors: self.colors), startPoint: .leading, endPoint: .trailing)
//                    .frame(width: self.radius * self.minSide(geo)),
//                         alignment: .leading)
//                .overlay(LinearGradient(gradient: Gradient(colors: self.colors), startPoint: .trailing, endPoint: .leading)
//                    .frame(width: self.radius * self.minSide(geo)),
//                         alignment: .trailing)
        }
    }

    func minSide(_ geo: GeometryProxy) -> CGFloat {
        CGFloat(3) * min(geo.size.width, geo.size.height) / 2
    }
}
