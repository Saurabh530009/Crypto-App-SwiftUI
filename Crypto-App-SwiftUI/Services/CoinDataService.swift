//
//  CoinDataService.swift
//  Crypto-App-SwiftUI
//
//  Created by Saurabh  Verma on 21/08/24.
//

import Foundation
import Combine

class CoinDataService {
    @Published var allCoins: [CoinModel] = []
    private var cancellable = Set<AnyCancellable>()
    private var coinSubcription: AnyCancellable?
    init() {
        getCoin()
    }
    private func getCoin() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h&x-cg-pro-api-key=CG-gzohujWLwGAaACpzy3denCzo") else { return }
        
        /// coinCancellable is used for cancelling this dataTaskPublisher when it fetch data. dataTaskPublisher is continuously listening for next data.
        coinSubcription = NetworkManager.downloadData(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkManager.subscriberCompletionError, receiveValue: { [weak self] (decodedData) in
                self?.allCoins = decodedData
                self?.coinSubcription?.cancel()
                
            })
    }
}
