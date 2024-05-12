//
//  CreditReportInfoView.swift
//  Clear_Test
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import SwiftUI

struct CreditReportInfoView<CreditReportData: CreditReportInfoViewInterface>: View {
    @EnvironmentObject var data: CreditReportData
    
    var body: some View {
        Group {
            if let creditReportInfo = data.creditReportInfo {
                List {
                    if let score = creditReportInfo.score {
                        CreditDetailListItem(keyString: String(localized: "score"), valueString: score.description)
                    }
                    if let scoreBand = creditReportInfo.scoreBand {
                        CreditDetailListItem(keyString: String(localized: "score_band"), valueString: scoreBand.description)
                    }
                    if let clientRef = creditReportInfo.clientRef {
                        CreditDetailListItem(keyString: String(localized: "client_reference"), valueString: clientRef.description)
                    }
                    if let status = creditReportInfo.status {
                        CreditDetailListItem(keyString: String(localized: "score"), valueString: status.description)
                    }
                    if let maxScoreValue = creditReportInfo.maxScoreValue {
                        CreditDetailListItem(keyString: String(localized: "max_score"), valueString: maxScoreValue.description)
                    }
                    if let minScoreValue = creditReportInfo.minScoreValue {
                        CreditDetailListItem(keyString: String(localized: "minimum_score"), valueString: minScoreValue.description)
                    }
                    if let monthsSinceLastDefaulted = creditReportInfo.monthsSinceLastDefaulted {
                        CreditDetailListItem(keyString: String(localized: "months_since_last_defaulted"), valueString: monthsSinceLastDefaulted.description)
                    }
                    if let hasEverDefaulted = creditReportInfo.hasEverDefaulted {
                        CreditDetailListItem(keyString: String(localized: "has_ever_defaulted"), valueString: hasEverDefaulted.description)
                    }
                    if let monthsSinceLastDelinquent = creditReportInfo.monthsSinceLastDelinquent {
                        CreditDetailListItem(keyString: String(localized: "months_since_last_delinquent"), valueString: monthsSinceLastDelinquent.description)
                    }
                    if let hasEverBeenDelinquent = creditReportInfo.hasEverBeenDelinquent {
                        CreditDetailListItem(keyString: String(localized: "has_ever_been_delinquent"), valueString: hasEverBeenDelinquent.description)
                    }
                    if let percentageCreditUsed = creditReportInfo.percentageCreditUsed {
                        CreditDetailListItem(keyString: String(localized: "percentage_credit_used"), valueString: percentageCreditUsed.description)
                    }
                    if let percentageCreditUsedDirectionFlag = creditReportInfo.percentageCreditUsedDirectionFlag {
                        CreditDetailListItem(keyString: String(localized: "percentage_credit_used_direction_flag"), valueString: percentageCreditUsedDirectionFlag.description)
                    }
                    if let changedScore = creditReportInfo.changedScore {
                        CreditDetailListItem(keyString: String(localized: "changed_score"), valueString: changedScore.description)
                    }
                    if let currentShortTermDebt = creditReportInfo.currentShortTermDebt {
                        CreditDetailListItem(keyString: String(localized: "current_short_term_debt"), valueString: currentShortTermDebt.description)
                    }
                    if let currentShortTermNonPromotionalDebt = creditReportInfo.currentShortTermNonPromotionalDebt {
                        CreditDetailListItem(keyString: String(localized: "current_short_term_non_promotional_debt"), valueString: currentShortTermNonPromotionalDebt.description)
                    }
                    if let currentShortTermCreditLimit = creditReportInfo.currentShortTermCreditLimit {
                        CreditDetailListItem(keyString: String(localized: "current_short_term_credit_limit"), valueString: currentShortTermCreditLimit.description)
                    }
                    if let currentShortTermCreditUtilisation = creditReportInfo.currentShortTermCreditUtilisation {
                        CreditDetailListItem(keyString: String(localized: "current_short_term_credit_utilisation"), valueString: currentShortTermCreditUtilisation.description)
                    }
                    if let changeInShortTermDebt = creditReportInfo.changeInShortTermDebt {
                        CreditDetailListItem(keyString: String(localized: "change_in_short_term_debt"), valueString: changeInShortTermDebt.description)
                    }
                    if let currentLongTermDebt = creditReportInfo.currentLongTermDebt {
                        CreditDetailListItem(keyString: String(localized: "current_long_term_debt"), valueString: currentLongTermDebt.description)
                    }
                    if let currentLongTermNonPromotionalDebt = creditReportInfo.currentLongTermNonPromotionalDebt {
                        CreditDetailListItem(keyString: String(localized: "current_long_term_non_promotional_debt"), valueString: currentLongTermNonPromotionalDebt.description)
                    }
                    if let currentLongTermCreditLimit = creditReportInfo.currentLongTermCreditLimit {
                        CreditDetailListItem(keyString: String(localized: "current_long_term_credit_limit"), valueString: currentLongTermCreditLimit.description)
                    }
                    if let currentLongTermCreditUtilisation = creditReportInfo.currentLongTermCreditUtilisation {
                        CreditDetailListItem(keyString: String(localized: "current_long_term_credit_utilisation"), valueString: currentLongTermCreditUtilisation.description)
                    }
                    if let changeInLongTermDebt = creditReportInfo.changeInLongTermDebt {
                        CreditDetailListItem(keyString: String(localized: "change_in_long_term_debt"), valueString: changeInLongTermDebt.description)
                    }
                    if let numPositiveScoreFactors = creditReportInfo.numPositiveScoreFactors {
                        CreditDetailListItem(keyString: String(localized: "number_of_positive_score_factors"), valueString: numPositiveScoreFactors.description)
                    }
                    if let numNegativeScoreFactors = creditReportInfo.numNegativeScoreFactors {
                        CreditDetailListItem(keyString: String(localized: "number_of_negative_score_factors"), valueString: numNegativeScoreFactors.description)
                    }
                    if let equifaxScoreBand = creditReportInfo.equifaxScoreBand {
                        CreditDetailListItem(keyString: String(localized: "equifax_score_band"), valueString: equifaxScoreBand.description)
                    }
                    if let equifaxScoreBandDescription = creditReportInfo.equifaxScoreBandDescription {
                        CreditDetailListItem(keyString: String(localized: "equifax_score_band_description"), valueString: equifaxScoreBandDescription.description)
                    }
                    if let daysUntilNextReport = creditReportInfo.daysUntilNextReport {
                        CreditDetailListItem(keyString: String(localized: "days_until_next_report"), valueString: daysUntilNextReport.description)
                    }
                }
            } else {
                Text(String(localized: "no_data"))
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(LocalizedStringKey("dashboard_title"))
                    .foregroundColor(.white)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CreditReportInfoView<StubCreditReportInfoModel>()
        .environmentObject(StubCreditReportInfoModel())
}
