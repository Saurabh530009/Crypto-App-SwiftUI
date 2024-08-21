//
//  CoinImageViewModel.swift
//  Crypto-App-SwiftUI
//
//  Created by Saurabh  Verma on 21/08/24.
//

import Foundation
import SwiftUI
import Combine
class CoinImageViewModel: ObservableObject {
    @Published var coinImage: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private var cancellable: AnyCancellable?
    private let dataService: CoinImageService
    
    init(urlString: String) {
        dataService = CoinImageService(urlString: urlString)
        addSubscriber()
    }
    private func addSubscriber() {
        cancellable = dataService.$image
            .sink { [weak self] (_) in
                self?.isLoading = false
                self?.cancellable?.cancel()
            } receiveValue: { [weak self] image in
                self?.coinImage = image
            }
    }
}
