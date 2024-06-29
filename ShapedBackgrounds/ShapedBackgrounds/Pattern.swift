//
//  Pattern.swift
//  ShapedBackgrounds
//
//  Created by Denys on 28.06.2024.
//

import SwiftUI

struct Pattern<Content: Shape>: View {
    
    let height : CGFloat
    let width : CGFloat
    let spacing: CGFloat
    let color: Color
    let opacity: Double
    let shape: Content
    
    init(height: CGFloat, width: CGFloat, spacing: CGFloat, color: Color, opacity: Double, @ViewBuilder shape: () -> Content) {
        self.height = height
        self.width = width
        self.spacing = spacing
        self.color = color
        self.opacity = opacity
        self.shape = shape()
    }
    
    var body: some View {
        GeometryReader{ gr in
            let col = gr.size.width / CGFloat(self.width + spacing)
            let row = gr.size.height / CGFloat(self.height + spacing)
            
//            let col = gr.size.width / self.width
//            let row = gr.size.height / self.height
//            let vSpace = (gr.size.height - row * height)/row
//            let hSpace = (gr.size.width - col * width)/col
            
            VStack(alignment: .center, spacing: spacing) {
                ForEach(0..<Int(row + 1), id: \.self) { _ in
                    HStack(alignment: .center, spacing: spacing) {
                        ForEach(0..<Int(col + 1), id: \.self) { _ in
                            CustomShape(h: height, w: width, opacity: opacity, color: color) {
                                shape
                            }
                        }
                    }
                }
            }
        }
    }
}

extension View {
    
    //try make closure and turn down to Pattern
//    func patternBackground(height: CGFloat, width: CGFloat, spacing: CGFloat, shape: Shapes, color: Color, opacity: Double) -> some View {
//        self.background {
//            Pattern(height: height, width: width, spacing: spacing, shape: shape, color: color, opacity: opacity)
//        }
//    }
    
    func patternBackground<Content: Shape>(height: CGFloat, width: CGFloat, spacing: CGFloat, color: Color, opacity: Double, @ViewBuilder shape: () -> Content) -> some View {
        self.background(alignment: .center) {
            Pattern(height: height, width: width, spacing: spacing, color: color, opacity: opacity) {
                shape()
            }
            
        }
        .clipped()
    }
}

#Preview {
    Pattern(height: 10, width: 10, spacing: 5, color: .blue, opacity: 0.5) {
        Rectangle()
    }
}
