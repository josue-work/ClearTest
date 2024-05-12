//
//  CreditModelInterface.swift
//  Clear_Test
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import Foundation

// Interface used to make testing smoother
protocol CreditModelInterface: CoachingSummaryViewInterface, CreditReportInfoViewInterface {
    var creditData: CreditModel? { get }
}
