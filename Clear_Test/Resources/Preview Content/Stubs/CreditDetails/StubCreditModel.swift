//
//  StubCreditModel.swift
//  Clear_Test
//
//  This is a stubbing class used in previews and UITesting
//  This is used to stub credit model
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import Foundation

final class StubCreditModel: CreditModelInterface {
    let coachingSummary: CoachingSummaryModel?
    let creditReportInfo: CreditReportInfoModel?
    let creditData: CreditModel?
    
    init() {
        self.coachingSummary = StubCoachingSummaryModel().coachingSummary
        self.creditReportInfo = StubCreditReportInfoModel().creditReportInfo
        self.creditData = CreditModel(accountIDVStatus: "PASS",
                                      creditReportInfo: creditReportInfo,
                                      dashboardStatus: "PASS",
                                      personaType: "INEXPERIENCED",
                                      coachingSummary: coachingSummary,
                                      augmentedCreditScore: nil)
    }
}
