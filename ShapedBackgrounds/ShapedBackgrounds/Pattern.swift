//
//  Pattern.swift
//  ShapedBackgrounds
//
//  Created by Denys on 28.06.2024.
//

import SwiftUI

struct Pattern: View {
    
    let size : CGFloat
    let spacing : CGFloat
    
    
    
    var body: some View {
        GeometryReader{ gr in
            let col = gr.size.width / CGFloat(size + spacing)
            let row = gr.size.height / CGFloat(size + spacing)
            
            VStack(spacing: spacing) {
                ForEach(0..<Int(row + 1), id: \.self) { _ in
                    HStack(spacing: spacing) {
                        ForEach(0..<Int(col + 1), id: \.self) { _ in
                            dotCircle(h: self.size, w: self.size)
                        }
                    }
                }
            }
        }
    }
}

extension View {
    func customBackground(size: CGFloat, spacing: CGFloat, form: any FormView) -> some View {
        self.background {
            Pattern(size: size, spacing: spacing) {
                form
            }
        }
    }
}

#Preview {
    Pattern(size: 3, spacing: 3)
}
