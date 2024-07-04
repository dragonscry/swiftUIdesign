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
                .customBack(image_name: "dodle", opacity: 0.1)
                .cornerRadius(20)
    }
}

#Preview {
    RandomBackground()
}

extension View {
    func customBack(image_name: String, opacity: CGFloat) -> some View {
        let img: UIImage = UIImage(named: image_name)!
        let h: CGFloat = img.size.height
        let w: CGFloat = img.size.width
            
        return self.background {
                GeometryReader { geo in
                    let x = geo.size.width
                    let y = geo.size.height
                    Image(image_name)
                        .offset(x: CGFloat(Int.random(in: Int(-(w-x))...0)), y: CGFloat(Int.random(in: Int(-(h-y))...0)))
                        .opacity(opacity)
                    
//                        .offset(CGSize(width: Int.random(in: -(w!-x)/2...(w!-x)/2), height: -(h!-y)/2...(h!-y)/2))
                }
            }
            .clipped()
    }
}

