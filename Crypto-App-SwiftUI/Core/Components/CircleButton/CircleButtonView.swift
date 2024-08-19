//
//  CircleButtonView.swift
//  Crypto-App-SwiftUI
//
//  Created by Saurabh  Verma on 18/08/24.
//

import SwiftUI

struct CircleButtonView: View {
    let iconName: String
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(.theme.accent)
            .frame(width: 50, height: 50)
            .background (
                Circle()
                    .foregroundColor(.theme.background)
            )
            .shadow(color: .theme.accent.opacity(0.25), radius: 10, x: 0, y: 0)
            .padding()
    }
}

#Preview {
    Group {
        CircleButtonView(iconName: "info")
            .previewLayout(.sizeThatFits)
        
        CircleButtonView(iconName: "plus")
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
