//
//  CreditDataService.swift
//  Clear_Test
//
//  This is our creditDataService used to make a request with URLSession item
//  We make use of our URLSessionProtocol to allow us to mock URLSession for our testing
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import Foundation
import Combine

final class CreditDataService<T: URLSessionProtocol> {
    
    private let baseURL: String
    private let session: T

    init(baseURL: String = "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/", session: T) {
        self.baseURL = baseURL
        self.session = session
    }
    
    func get<APIResponse: Decodable>(ForEndpoint endpoint: NetworkEndpoints, WithDataType: APIResponse.Type) -> AnyPublisher<APIResponse, NetworkError> {
        guard !baseURL.isEmpty,
                let url = URL(string: self.baseURL.appending(endpoint.rawValue)) else {
            return Fail(outputType: APIResponse.self, failure: NetworkError.badURL).eraseToAnyPublisher()
        }
        let request = URLRequest(url: url)
        
        return session.response(for: request)
            .mapError { _ in
                NetworkError.unknown
            }
            .flatMap { output in
                return Just(output.data)
                    .decode(type: APIResponse.self, decoder: JSONDecoder())
                    .mapError { _ in
                        NetworkError.decode
                    }
            }
            .eraseToAnyPublisher()
    }
}
