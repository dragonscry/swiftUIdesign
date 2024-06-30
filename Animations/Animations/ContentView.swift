//
//  ContentView.swift
//  Animations
//
//  Created by Denys on 30.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var showFirst = true
    var body: some View {
        VStack(spacing: 24, content: {
            if showFirst {
                First()
                    .transition(.moveScaleAndFade)
            } else {
                Second()
                    .transition(.moveScaleAndFade)
            }
            
            Button {
                showFirst.toggle()
            } label: {
                Text("Change")
            }

        })
        .animation(Animation.easeInOut(duration: 1), value: showFirst)
        .padding(.horizontal, 20)
    }
    
}

#Preview {
    ContentView()
}

struct AnimationType : Hashable{
    let name: String
    let animation: Animation
    
    static var all: [AnimationType] = [
        .init(name: "default", animation: .default),
        .init(name: "easeIn", animation: .easeIn),
        .init(name: "easeInOut", animation: .easeInOut),
        .init(name: "linear", animation: .linear),
        .init(name: "spring", animation: .spring),
    ]
    
}

extension Image {
    func custom() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(20)
            .shadow(radius: 10)
    }
}

struct First: View {
    var body: some View {
        Image("horizon")
            .custom()
    }
}

struct Second: View {
    var body: some View {
        Image("holow")
            .custom()
    }
}

extension AnyTransition {
    static var moveScaleAndFade: AnyTransition {
        let insertion = AnyTransition
            .scale
            .combined(with: .move(edge: .leading))
            .combined(with: .opacity)
        let removal = AnyTransition
            .scale
            .combined(with: .move(edge: .top))
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}
