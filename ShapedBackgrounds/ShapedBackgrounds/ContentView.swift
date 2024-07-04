//
//  ContentView.swift
//  ShapedBackgrounds
//
//  Created by Denys on 28.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    var arr = ["1", "1", "2", "3"]
    var body: some View {
        VStack {
            Rectangle()
                .fill(RadialGradient(colors: [.blue, .green, .red, .yellow], center: .center, startRadius: 10, endRadius: 300))
                .frame(width: 300, height: 300)
                .mask {
                    Pattern(height: 10, width: 10, spacing: 5, color: .blue, opacity: 0.5) {
                        Circle()
                    }
            }
            ForEach(arr, id: \.self) { item in
                Text(item)
            }
        }

        //.background(Color(.blue).opacity(0.2))
    }
}


#Preview {
    ContentView()
}
//extension View {
//    func background()
//}
