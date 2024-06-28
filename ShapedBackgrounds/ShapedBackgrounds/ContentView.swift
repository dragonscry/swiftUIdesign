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
        .customBackground()
    }
}

#Preview {
    ContentView()
}
//extension View {
//    func background()
//}
