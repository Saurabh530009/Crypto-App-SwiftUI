//
//  NetworkManager.swift
//  Crypto-App-SwiftUI
//
//  Created by Saurabh  Verma on 21/08/24.
//

import Foundation
import Combine

class NetworkManager {
    enum NetworkError: LocalizedError {
        case badURLError(url: URL)
        case unowned
        
        var errorDescription: String? {
            switch self {
            case .badURLError(let url):
                return "[🔥] Bad response from URL:-> \(url)"
            case .unowned:
                return "[🚨] Unknown error occurs"
            }
        }
    }
    static func downloadData(url: URL) -> AnyPublisher<Data, any Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({try handleURLResponse(output: $0, url: url)})
            .eraseToAnyPublisher()
        /*
         .tryMap { (output) -> Data in
            return try handleURLResponse(output: output, url: url)
         }
         
         And
         
         .tryMap({try handleURLResponse(output: $0, url: url)})
         
         are same
         */
    }
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkError.badURLError(url: url)
        }
        return output.data
    }
    static func subscriberCompletionError(completion: Subscribers.Completion<any Error>) {
        switch completion {
        case .finished: break
        case .failure(let error):
            debugPrint(error.localizedDescription)
        }
    }
}
