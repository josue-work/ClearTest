//
//  StubCreditViewModel.swift
//  Clear_Test
//
//  This is a stubbing class used in previews and UITesting
//  This is used to stub CreditViewModel
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import Foundation

class StubCreditViewModel: CreditViewModelInterface {
    var error: Error? = NetworkError.responseError(StatusCode: 409)
    var coachingSummary: CoachingSummaryModel?
    var creditReportInfo: CreditReportInfoModel?
    var creditScore: Int? = 327
    var creditMaxScore: Int? = 700
    var creditData: CreditModel?
    func fetchCreditData() {}
    
    func filldata() {
        creditData = StubCreditModel().creditData
        if let creditScore = creditData?.creditReportInfo?.score {
            self.creditScore = creditScore
        }
        if let creditMaxScore = creditData?.creditReportInfo?.maxScoreValue {
            self.creditMaxScore = creditMaxScore
        }
        if let creditReportInfo = creditData?.creditReportInfo {
            self.creditReportInfo = creditReportInfo
        }
        if let coachingSummary = creditData?.coachingSummary {
            self.coachingSummary = coachingSummary
        }
        self.error = nil
    }
    
    init() {
        filldata()
    }
    
    init(error: Error) {
        self.creditScore = nil
        self.creditMaxScore = nil
        self.coachingSummary = nil
        self.creditReportInfo = nil
        self.creditData = nil
        self.error = error
    }
    
    init(emptyCreditReportInfo: Bool, emptyCoachingSummary: Bool) {
        filldata()
        if emptyCoachingSummary {
            self.coachingSummary = nil
            self.creditData?.coachingSummary = nil
        }
        
        if emptyCreditReportInfo {
            self.creditMaxScore = nil
            self.creditScore = nil
            self.creditReportInfo = nil
            self.creditData?.creditReportInfo = nil
        }
    }
}
