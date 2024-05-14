//
//  URLSessionProtocol.swift
//  Clear_Test
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import Foundation
import Combine

protocol URLSessionProtocol {
    typealias APIResponse = URLSession.DataTaskPublisher.Output
    func response(for request: URLRequest) -> AnyPublisher<APIResponse, URLError>
}
