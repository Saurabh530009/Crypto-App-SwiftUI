//
//  CoinImageService.swift
//  Crypto-App-SwiftUI
//
//  Created by Saurabh  Verma on 21/08/24.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    @Published var image: UIImage? = nil
    private var imageSubcription: AnyCancellable?
    init(urlString: String) {
        getImage(urlString: urlString)
    }
    private func getImage(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        imageSubcription = NetworkManager.downloadData(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkManager.subscriberCompletionError,
                  receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
                self?.imageSubcription?.cancel()
                
            })
    }
}
