//
//  CreditViewModelInterface.swift
//  Clear_Test
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import Foundation
import Combine

protocol CreditViewModelInterface: CircularViewInterface, CreditModelInterface, ErrorInterface {
    func fetchCreditData() -> AnyPublisher<CreditModel, NetworkError>?
}
