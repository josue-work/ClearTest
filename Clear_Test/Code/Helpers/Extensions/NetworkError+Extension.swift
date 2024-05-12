//
//  NetworkError+Extension.swift
//  Clear_Test
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import Foundation

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badURL:
            return String(localized: "url_is_invalid")
        case .responseError:
            return String(localized: "network_error")
        case .unknown:
            return String(localized: "unknown_error")
        case .decode:
            return String(localized: "unable_to_decode_response")
        }
    }
}
