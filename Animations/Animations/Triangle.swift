//
//  Triangle.swift
//  Animations
//
//  Created by Denys on 30.06.2024.
//

import SwiftUI

struct Triangle: Shape {
    var multiplier: CGFloat
    var animatableData: CGFloat {
        get {multiplier}
        set {multiplier = newValue}
    }
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY - multiplier * rect.width))
            path.closeSubpath()
        }
    }
}
