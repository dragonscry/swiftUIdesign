//
//  TwoCircles.swift
//  Animations
//
//  Created by Denys on 30.06.2024.
//

import SwiftUI

struct TwoCircles: View {
    @State private var onTop = false
    @State private var type = AnimationType(name: "default", animation: .default)
    @State private var showSelection = false
    var body: some View {
        VStack(spacing: 12) {
            GeometryReader{ geo in
                HStack {
                    Circle()
                        .fill(Color.blue.gradient)
                        .frame(width: 80, height: 80)
                        .offset(y: onTop ? geo.size.height : geo.size.height/2)
                        .animation(.default, value: onTop)
                    Spacer()
                    Circle()
                        .fill(Color.red.gradient)
                        .frame(width: 80, height: 80)
                        .offset(y: onTop ? geo.size.height : geo.size.height/2)
                        .animation(type.animation, value: onTop)
                }
                .padding(.horizontal, 30)
            }
            Button {
                onTop.toggle()
            } label: {
                Text("Animate")
            }
            Button {
                showSelection = true
            } label: {
                Text("Choose Animation")
            }
            .confirmationDialog("Animations", isPresented: $showSelection) {
                ForEach(AnimationType.all, id: \.self) { animType in
                    
                    Button(animType.name) {
                        self.type = animType
                    }
                    
                }
            } message: {
                Text("Select new animation")
            }
            Text("Current: \(type.name)")


        }
    }
}

#Preview {
    TwoCircles()
}
