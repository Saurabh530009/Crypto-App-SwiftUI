//
//  HomeViewModel.swift
//  Crypto-App-SwiftUI
//
//  Created by Saurabh  Verma on 19/08/24.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    init() {
        addSubscriber()
    }
    
    func addSubscriber() {
        dataService.$allCoins
            .sink { [weak self] coinData in
                self?.allCoins = coinData
            }.store(in: &cancellables)
    }
}
