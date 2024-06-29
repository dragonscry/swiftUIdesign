//
//  FormsForPattern.swift
//  ShapedBackgrounds
//
//  Created by Denys on 28.06.2024.
//

import SwiftUI

//Make Generic with shapes
struct CustomShape<Content: Shape>: View {
    
    var h: CGFloat
    
    var w: CGFloat
    
    var opacity: Double
    
    var color: Color
    
    var shape: Content
    
    init(h: CGFloat, w: CGFloat, opacity: Double, color: Color, @ViewBuilder shape: () -> Content) {
        self.h = h
        self.w = w
        self.opacity = opacity
        self.color = color
        self.shape = shape()
    }
    
    var body: some View {
        shape
            .fill(self.color.opacity(self.opacity))
            .frame(width: w, height: h)
    }
}


