//
//  FormsForPattern.swift
//  ShapedBackgrounds
//
//  Created by Denys on 28.06.2024.
//

import SwiftUI

struct dotCircle: View {
    
    var h: CGFloat
    
    var w: CGFloat
    
    var body: some View {
        Circle()
            .fill(Color.gray.opacity(0.3))
            .frame(width: w, height: h)
    }
}

enum Forms {
    case circle, square
}

