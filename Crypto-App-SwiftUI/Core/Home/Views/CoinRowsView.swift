//
//  CoinRowsView.swift
//  Crypto-App-SwiftUI
//
//  Created by Saurabh  Verma on 19/08/24.
//

import SwiftUI

struct CoinRowsView: View {
    let coin: CoinModel
    let showHoldingColum: Bool
    var body: some View {
        HStack(spacing: 0) {
            leftColumn
            Spacer()
            if showHoldingColum {
                centreColumn
            }
            rightColumn
        }
        .font(.subheadline)
    }
}

struct CoinRowsView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            CoinRowsView(coin: dev.coin, showHoldingColum: true)
                .previewLayout(.sizeThatFits)
//            CoinRowsView(coin: dev.coin, showHoldingColum: false)
//                .previewLayout(.sizeThatFits)
//                .preferredColorScheme(.dark)
        }
    }
}

extension CoinRowsView {
    private var leftColumn: some View {
        HStack {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 30)
            CoinImageView(imageUrl: coin.image)
                .frame(width: 30, height: 30)
            
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading)
                .foregroundColor(.theme.accent)
        }
    }
    private var centreColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundColor(.theme.accent)
    }
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundColor(.theme.accent)
            Text(coin.priceChangePercentage24H?.asPercentageString() ?? "")
                .foregroundColor(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ?
                        .theme.green : .theme.red
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
