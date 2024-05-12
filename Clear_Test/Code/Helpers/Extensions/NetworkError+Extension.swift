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
            return NSLocalizedString(String(localized: "url_entered_is_not_valid"), comment: String(localized: "bad_url"))
        case .responseError:
            return NSLocalizedString(String(localized: "unhandled_status_code"), comment: String(localized: "bad_status_code"))
        case .unknown:
            return NSLocalizedString(String(localized: "unknown_error"), comment: String(localized: "unknown_error"))
        case .decode:
            return NSLocalizedString(String(localized: "error_decoding"), comment: String(localized: "unable_to_decode_response"))
        }
    }
}
