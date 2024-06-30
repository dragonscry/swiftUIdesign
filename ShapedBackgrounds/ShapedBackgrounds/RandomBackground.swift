//
//  RandomBackground.swift
//  ShapedBackgrounds
//
//  Created by Denys on 30.06.2024.
//

import SwiftUI

//1920x1280

//x = 1920 = Cwidth +- (1920 - Cwidth)/2
//y
//680x480

struct RandomBackground: View {
    var body: some View {
        Rectangle()
            .fill(.clear)
            .frame(width: 300, height: 200)
            .customBack(image_name: "dodle")
            .cornerRadius(20)
        
        
    }
}

#Preview {
    RandomBackground()
}

extension View {
    func customBack(image_name: String) -> some View {
        
        GeometryReader{geo in
            self.background {
                let mX = geo.size.width
                let yx = geo.size.height
                GeometryReader { gio in
                    let gX = gio.size.width
                    let gy = gio.size.height
                    Image("dodle")
                        .offset(x: CGFloat.random(in: -(gX-mX)/2...(gX-mX)/2), y: CGFloat.random(in: -(gy-yx)/2...(gy-yx)/2))
                        .opacity(0.2)

                }
                
            }
            .clipped()
        }
        
    }
}
