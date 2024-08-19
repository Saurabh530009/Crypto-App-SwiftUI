//
//  CircleButtonAnimationView.swift
//  Crypto-App-SwiftUI
//
//  Created by Saurabh  Verma on 18/08/24.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    @Binding var animate: Bool
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scale(animate ? 1.0 : 0)
            .opacity(animate ? 0 : 1.0)
            .animation(animate ? .easeOut(duration: 1.0) : .none)
//            .onAppear {
//                animate.toggle()
//            }
    }
}

#Preview {
    CircleButtonAnimationView(animate: .constant(false))
        .frame(width: 100, height: 100)
        .foregroundColor(.accent)
}
