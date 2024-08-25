//
//  CoinImageView.swift
//  Crypto-App-SwiftUI
//
//  Created by Saurabh  Verma on 21/08/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct CoinImageView: View {
    let imageUrl: String?
    
    var body: some View {
        ZStack {
            if let imageUrl,
                let url = URL(string: imageUrl) {
                WebImage(url: url)
                    .resizable()
                    .indicator(.activity)
                    .scaledToFit()
            } else {
                Image(systemName: "person.circle.fill")
                    .foregroundColor(.theme.secondaryText)
            }
        }
    }
}

struct CoinImageView_Preview: PreviewProvider {
    static var previews: some View {
        CoinImageView(imageUrl: dev.coin.image)
            .padding(.all)
            .previewLayout(.sizeThatFits)
    }
}
