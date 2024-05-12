//
//  NetworkError.swift
//  Clear_Test
//
//  Enum initialization for network errors
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import Foundation

enum NetworkError: Error, Equatable {
    case badURL
    case decode
    case responseError(StatusCode: Int?)
    case unknown
}
