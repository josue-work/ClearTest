//
//  CreditModel.swift
//  Clear_Test
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import Foundation

// Model for credit report from API
struct CreditModel: Codable, Hashable, Equatable {
    var accountIDVStatus: String?
    var creditReportInfo: CreditReportInfoModel?
    var dashboardStatus: String?
    var personaType: String?
    var coachingSummary: CoachingSummaryModel?
    var augmentedCreditScore: String?
}
