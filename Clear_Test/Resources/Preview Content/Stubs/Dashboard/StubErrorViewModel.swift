//
//  StubErrorViewModel.swift
//  Clear_Test
//
//  This is a stubbing class uonly sed in previews
//  This is used to stub error in a view model through the ErrorInterface
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import Foundation

final class StubErrorViewModel: ErrorInterface {
    let error: Error?
    
    init(_ error: Error?) {
        self.error = error
    }
}
