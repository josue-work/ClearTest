//
//  StubCreditDetailModel.swift
//  Clear_Test
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import Foundation

class StubCreditDetailModel: CreditModelInterface {
    var coachingSummary: CoachingSummaryModel?
    var creditReportInfo: CreditReportInfoModel?
    var creditData: CreditModel?
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
