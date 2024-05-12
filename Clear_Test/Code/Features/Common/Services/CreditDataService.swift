//
//  CreditDataService.swift
//  Clear_Test
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import Foundation
import Combine

class CreditDataService<T: URLSessionProtocol> {
    
    private var baseURL = "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/"

    
    let session: T
    init(session: T) {
        self.session = session
    }
    
    // Use only for testing
    init(baseURL: String, session: T) {
        self.baseURL = baseURL
        self.session = session
    }
    
    func get<S: Decodable>(ForEndpoint endpoint: NetworkEndpoints, WithDataType: S.Type) -> AnyPublisher<S, NetworkError> {
        guard !baseURL.isEmpty,
                let url = URL(string: self.baseURL.appending(endpoint.rawValue)) else {
            return Fail(outputType: S.self, failure: NetworkError.badURL).eraseToAnyPublisher()
        }
        let request = URLRequest(url: url)
        
        return session.response(for: request)
            .mapError { _ in
                NetworkError.unknown
            }
            .flatMap { output in
                return Just(output.data)
                    .decode(type: S.self, decoder: JSONDecoder())
                    .mapError { _ in
                        NetworkError.decode
                    }
            }
            .eraseToAnyPublisher()
    }
}
