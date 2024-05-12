//
//  NetworkError.swift
//  Clear_Test
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import Foundation

// Enum initialization for network errors
enum NetworkError: Error, Equatable {
    case badURL
    case decode
    case responseError(StatusCode: Int?)
    case unknown
}
