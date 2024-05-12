//
//  StubErrorViewModel.swift
//  Clear_Test
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import Foundation

class StubErrorViewModel: ErrorInterface {
    var error: Error? = NetworkError.badURL
    init(_ error: Error? = nil) {
        self.error = error
    }
}
