//
//  URLSession+Extension.swift
//  Clear_Test
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import Foundation
import Combine

extension URLSession: URLSessionProtocol {

    func response(for request: URLRequest) -> AnyPublisher<APIResponse, URLError> {
        dataTaskPublisher(for: request).eraseToAnyPublisher()
    }
}
