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
import Combine

final class StubCreditViewModel: CreditViewModelInterface {
    let error: Error?
    let coachingSummary: CoachingSummaryModel?
    let creditReportInfo: CreditReportInfoModel?
    let creditScore: Int?
    let creditMaxScore: Int?
    let creditData: CreditModel?
    
    func fetchCreditData() -> AnyPublisher<CreditModel, NetworkError>? {
        return nil
    }
    
    init() {
        creditData = StubCreditModel().creditData
        if let creditScore = creditData?.creditReportInfo?.score {
            self.creditScore = creditScore
        } else {
            self.creditScore = nil
        }
        
        if let creditMaxScore = creditData?.creditReportInfo?.maxScoreValue {
            self.creditMaxScore = creditMaxScore
        } else {
            self.creditMaxScore = nil
        }
        
        if let creditReportInfo = creditData?.creditReportInfo {
            self.creditReportInfo = creditReportInfo
        } else {
            self.creditReportInfo = nil
        }
        
        if let coachingSummary = creditData?.coachingSummary {
            self.coachingSummary = coachingSummary
        } else {
            self.coachingSummary = nil
        }
        self.error = nil
    }
    
    init(error: Error) {
        self.creditScore = nil
        self.creditMaxScore = nil
        self.coachingSummary = nil
        self.creditReportInfo = nil
        self.creditData = nil
        let stubError = StubErrorViewModel(error)
        self.error = stubError.error
    }
    
    init(emptyCreditReportInfo: Bool, emptyCoachingSummary: Bool) {
        var innerCreditData = StubCreditModel().creditData
        
        self.error = nil
        
        if emptyCoachingSummary {
            self.coachingSummary = nil
            innerCreditData?.coachingSummary = nil
        } else {
            if let coachingSummary = innerCreditData?.coachingSummary {
                self.coachingSummary = coachingSummary
            } else {
                self.coachingSummary = nil
            }
        }
        
        if emptyCreditReportInfo {
            self.creditMaxScore = nil
            self.creditScore = nil
            self.creditReportInfo = nil
            innerCreditData?.creditReportInfo = nil
        } else {
            if let creditScore = innerCreditData?.creditReportInfo?.score {
                self.creditScore = creditScore
            } else {
                self.creditScore = nil
            }
            if let creditMaxScore = innerCreditData?.creditReportInfo?.maxScoreValue {
                self.creditMaxScore = creditMaxScore
            } else {
                self.creditMaxScore = nil
            }
            if let creditReportInfo = innerCreditData?.creditReportInfo {
                self.creditReportInfo = creditReportInfo
            } else {
                self.creditReportInfo = nil
            }
        }
        self.creditData = innerCreditData
    }
}
