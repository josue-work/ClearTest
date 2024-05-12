//
//  DashboardViewModelInterface.swift
//  Clear_Test
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import Foundation

protocol DashboardViewModelInterface: CircularViewInterface, CreditModelInterface, ErrorInterface {
    func fetchCreditData()
}
