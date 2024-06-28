//
//  ContentView.swift
//  Neumorphism
//
//  Created by Denys on 28.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 10){
                Text("This is neumorp")
                Text("Yes it is")
            }
            .neumorp()
            Spacer()
        }
        .padding()
        .background(Color.offWhite)
        
    }
}

#Preview {
    ContentView()
}

extension Color {
    static let offWhite = Color(red: 225/255, green: 225/255, blue: 235/255)
}

extension View {
    func neumorp() -> some View {
        self.padding(30)
            .frame(maxWidth: .infinity)
            .background(Color.offWhite)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
    }
}
