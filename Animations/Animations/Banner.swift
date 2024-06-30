//
//  Banner.swift
//  Animations
//
//  Created by Denys on 30.06.2024.
//

import SwiftUI

struct Banner: View {
    
    let message: String
    var show: Bool
    
    var body: some View {
        Text(message)
            .font(.title)
            .frame(width: UIScreen.main.bounds.width - 20, height: 100)
            .foregroundColor(.white)
            .background(Color.green)
            .cornerRadius(10)
            .offset(y: show ? -UIScreen.main.bounds.height / 3 : -UIScreen.main.bounds.height)
            .animation(.interpolatingSpring(mass: 1, stiffness: 100, damping: 10, initialVelocity: 0), value: show)
    }
}

#Preview {
    Banner(message: "Hello", show: true)
}

