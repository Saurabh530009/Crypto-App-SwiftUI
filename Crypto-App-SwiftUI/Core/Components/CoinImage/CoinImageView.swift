//
//  CoinImageView.swift
//  Crypto-App-SwiftUI
//
//  Created by Saurabh  Verma on 21/08/24.
//

import SwiftUI

struct CoinImageView: View {
    @StateObject var vm: CoinImageViewModel
    init(urlString: String) {
        _vm = StateObject(wrappedValue: CoinImageViewModel(urlString: urlString))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.coinImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "person.circle.fill")
                    .foregroundColor(.theme.secondaryText)
            }
        }
    }
}

struct CoinImageView_Preview: PreviewProvider {
    static var previews: some View {
        CoinImageView(urlString: dev.coin.image)
            .padding(.all)
            .previewLayout(.sizeThatFits)
    }
}
