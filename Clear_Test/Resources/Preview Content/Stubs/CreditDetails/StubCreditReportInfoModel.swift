//
//  StubCreditReportInfoModel.swift
//  Clear_Test
//
//  This is a stubbing class used in previews and UITesting
//  This is used to stub credit report info model
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import Foundation

class StubCreditReportInfoModel: CreditReportInfoViewInterface {
    var creditReportInfo: CreditReportInfoModel?
    init() {
        self.creditReportInfo = CreditReportInfoModel(score: 414,
                                                      scoreBand: 5,
                                                      clientRef: "CS-SED-634897-708782",
                                                      status: "MATCH",
                                                      maxScoreValue: 850,
                                                      minScoreValue: 0,
                                                      monthsSinceLastDefaulted: -1,
                                                      hasEverDefaulted: false,
                                                      monthsSinceLastDelinquent: 1,
                                                      hasEverBeenDelinquent: true,
                                                      percentageCreditUsed: 44,
                                                      percentageCreditUsedDirectionFlag: 1,
                                                      changedScore: 0,
                                                      currentShortTermDebt: 13758,
                                                      currentShortTermNonPromotionalDebt: 13758,
                                                      currentShortTermCreditLimit: 30600,
                                                      currentShortTermCreditUtilisation: 44,
                                                      changeInShortTermDebt: 549,
                                                      currentLongTermDebt: 24682,
                                                      currentLongTermNonPromotionalDebt: 24682,
                                                      currentLongTermCreditLimit: nil,
                                                      currentLongTermCreditUtilisation: nil,
                                                      changeInLongTermDebt: -327,
                                                      numPositiveScoreFactors: 9,
                                                      numNegativeScoreFactors: 0,
                                                      equifaxScoreBand: 4,
                                                      equifaxScoreBandDescription: "Excellent",
                                                      daysUntilNextReport: 9)
    }
}
