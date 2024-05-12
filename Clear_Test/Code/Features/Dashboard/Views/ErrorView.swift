//
//  ErrorView.swift
//  Clear_Test
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import SwiftUI

struct ErrorView<ErrorData: ErrorInterface>: View {
    @EnvironmentObject private var errorData: ErrorData
    
    var body: some View {
        if let networkError = errorData.error as? NetworkError {
            switch networkError {
            case .badURL:
                Text(String(localized: "url_is_invalid"))
                Text(String(localized: "please_contact_developer"))
            case .responseError(let statusCode):
                Text("\(String(localized: "network_error")):\t")
                +
                Text(statusCode?.description ?? "")
                Text(String(localized: "please_contact_developer"))
            case .unknown:
                Text(String(localized: "unknown_error"))
                Text(String(localized: "please_contact_developer"))
            case .decode:
                Text(String(localized: "unable_to_decode_response"))
                Text(String(localized: "please_contact_developer"))
            }
        } else {
            Text("\(String(localized: "unknown_error")):\t")
            +
            Text(errorData.error?.localizedDescription ?? "")
            Text(String(localized: "please_contact_developer"))
        }
    }
}

#Preview {
    ErrorView<StubErrorViewModel>()
        .environmentObject(StubErrorViewModel(NetworkError.unknown))
}
