//
//  ErrorView.swift
//  Clear_Test
//
//  This is our error view used by the dashboard
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import SwiftUI

struct ErrorView<ErrorData: ErrorInterface>: View {
    
    // MARK: - Variables
    @EnvironmentObject private var errorData: ErrorData
    
    // MARK: - Body view
    var body: some View {
        if let networkError = errorData.error as? NetworkError {
            switch networkError {
            case .badURL:
                Text(NetworkError.badURL.errorDescription ?? String(localized: "unknown_error"))
                Text(String(localized: "please_contact_developer"))
            case .responseError(let statusCode):
                Text("\(NetworkError.responseError(StatusCode: statusCode).errorDescription ?? String(localized: "unknown_error")):\t")
                +
                Text(statusCode?.description ?? "")
                Text(String(localized: "please_contact_developer"))
            case .unknown:
                Text(NetworkError.unknown.errorDescription ?? String(localized: "unknown_error"))
                Text(String(localized: "please_contact_developer"))
            case .decode:
                Text(NetworkError.decode.errorDescription ?? String(localized: "unknown_error"))
                Text(String(localized: "please_contact_developer"))
            }
        } else {
            Text("\(String(localized: "unknown_error")):\t")
            Text(errorData.error?.localizedDescription ?? "")
                .padding()
            Text(String(localized: "please_contact_developer"))
        }
    }
}

#Preview {
    ErrorView<StubErrorViewModel>()
        .environmentObject(StubErrorViewModel(NSError(domain: "my custom error", code: -1)))
}
