//
//  ContentView.swift
//  ShapedBackgrounds
//
//  Created by Denys on 28.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center){
            Text("Hello world")
                .padding()
            Text("Hello Irra")
                .padding()
        }
        //.background(Color(.blue).opacity(0.2))
        .patternBackground(height: 5, width: 5, spacing: 3, color: .yellow, opacity: 0.6) {
            RoundedRectangle(cornerRadius: 5)
        }
    }
}

#Preview {
    ContentView()
}
//extension View {
//    func background()
//}
