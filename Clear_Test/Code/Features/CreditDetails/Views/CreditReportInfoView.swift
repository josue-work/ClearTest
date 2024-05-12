//
//  CreditReportInfoView.swift
//  Clear_Test
//
//  This view has the list for the credit report info model
//  within the big credit model
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import SwiftUI

struct CreditReportInfoView<CreditReportData: CreditReportInfoViewInterface>: View {
    
    // MARK: - Variables
    @EnvironmentObject var data: CreditReportData
    
    // MARK: - Body View
    var body: some View {
        Group {
            if let creditReportInfo = data.creditReportInfo {
                List {
                    if let score = creditReportInfo.score {
                        ListItem(keyString: String(localized: "score"), valueString: score.description)
                    }
                    if let scoreBand = creditReportInfo.scoreBand {
                        ListItem(keyString: String(localized: "score_band"), valueString: scoreBand.description)
                    }
                    if let clientRef = creditReportInfo.clientRef {
                        ListItem(keyString: String(localized: "client_reference"), valueString: clientRef.description)
                    }
                    if let status = creditReportInfo.status {
                        ListItem(keyString: String(localized: "score"), valueString: status.description)
                    }
                    if let maxScoreValue = creditReportInfo.maxScoreValue {
                        ListItem(keyString: String(localized: "max_score"), valueString: maxScoreValue.description)
                    }
                    if let minScoreValue = creditReportInfo.minScoreValue {
                        ListItem(keyString: String(localized: "minimum_score"), valueString: minScoreValue.description)
                    }
                    if let monthsSinceLastDefaulted = creditReportInfo.monthsSinceLastDefaulted {
                        ListItem(keyString: String(localized: "months_since_last_defaulted"), valueString: monthsSinceLastDefaulted.description)
                    }
                    if let hasEverDefaulted = creditReportInfo.hasEverDefaulted {
                        ListItem(keyString: String(localized: "has_ever_defaulted"), valueString: hasEverDefaulted.description)
                    }
                    if let monthsSinceLastDelinquent = creditReportInfo.monthsSinceLastDelinquent {
                        ListItem(keyString: String(localized: "months_since_last_delinquent"), valueString: monthsSinceLastDelinquent.description)
                    }
                    if let hasEverBeenDelinquent = creditReportInfo.hasEverBeenDelinquent {
                        ListItem(keyString: String(localized: "has_ever_been_delinquent"), valueString: hasEverBeenDelinquent.description)
                    }
                    if let percentageCreditUsed = creditReportInfo.percentageCreditUsed {
                        ListItem(keyString: String(localized: "percentage_credit_used"), valueString: percentageCreditUsed.description)
                    }
                    if let percentageCreditUsedDirectionFlag = creditReportInfo.percentageCreditUsedDirectionFlag {
                        ListItem(keyString: String(localized: "percentage_credit_used_direction_flag"), valueString: percentageCreditUsedDirectionFlag.description)
                    }
                    if let changedScore = creditReportInfo.changedScore {
                        ListItem(keyString: String(localized: "changed_score"), valueString: changedScore.description)
                    }
                    if let currentShortTermDebt = creditReportInfo.currentShortTermDebt {
                        ListItem(keyString: String(localized: "current_short_term_debt"), valueString: currentShortTermDebt.description)
                    }
                    if let currentShortTermNonPromotionalDebt = creditReportInfo.currentShortTermNonPromotionalDebt {
                        ListItem(keyString: String(localized: "current_short_term_non_promotional_debt"), valueString: currentShortTermNonPromotionalDebt.description)
                    }
                    if let currentShortTermCreditLimit = creditReportInfo.currentShortTermCreditLimit {
                        ListItem(keyString: String(localized: "current_short_term_credit_limit"), valueString: currentShortTermCreditLimit.description)
                    }
                    if let currentShortTermCreditUtilisation = creditReportInfo.currentShortTermCreditUtilisation {
                        ListItem(keyString: String(localized: "current_short_term_credit_utilisation"), valueString: currentShortTermCreditUtilisation.description)
                    }
                    if let changeInShortTermDebt = creditReportInfo.changeInShortTermDebt {
                        ListItem(keyString: String(localized: "change_in_short_term_debt"), valueString: changeInShortTermDebt.description)
                    }
                    if let currentLongTermDebt = creditReportInfo.currentLongTermDebt {
                        ListItem(keyString: String(localized: "current_long_term_debt"), valueString: currentLongTermDebt.description)
                    }
                    if let currentLongTermNonPromotionalDebt = creditReportInfo.currentLongTermNonPromotionalDebt {
                        ListItem(keyString: String(localized: "current_long_term_non_promotional_debt"), valueString: currentLongTermNonPromotionalDebt.description)
                    }
                    if let currentLongTermCreditLimit = creditReportInfo.currentLongTermCreditLimit {
                        ListItem(keyString: String(localized: "current_long_term_credit_limit"), valueString: currentLongTermCreditLimit.description)
                    }
                    if let currentLongTermCreditUtilisation = creditReportInfo.currentLongTermCreditUtilisation {
                        ListItem(keyString: String(localized: "current_long_term_credit_utilisation"), valueString: currentLongTermCreditUtilisation.description)
                    }
                    if let changeInLongTermDebt = creditReportInfo.changeInLongTermDebt {
                        ListItem(keyString: String(localized: "change_in_long_term_debt"), valueString: changeInLongTermDebt.description)
                    }
                    if let numPositiveScoreFactors = creditReportInfo.numPositiveScoreFactors {
                        ListItem(keyString: String(localized: "number_of_positive_score_factors"), valueString: numPositiveScoreFactors.description)
                    }
                    if let numNegativeScoreFactors = creditReportInfo.numNegativeScoreFactors {
                        ListItem(keyString: String(localized: "number_of_negative_score_factors"), valueString: numNegativeScoreFactors.description)
                    }
                    if let equifaxScoreBand = creditReportInfo.equifaxScoreBand {
                        ListItem(keyString: String(localized: "equifax_score_band"), valueString: equifaxScoreBand.description)
                    }
                    if let equifaxScoreBandDescription = creditReportInfo.equifaxScoreBandDescription {
                        ListItem(keyString: String(localized: "equifax_score_band_description"), valueString: equifaxScoreBandDescription.description)
                    }
                    if let daysUntilNextReport = creditReportInfo.daysUntilNextReport {
                        ListItem(keyString: String(localized: "days_until_next_report"), valueString: daysUntilNextReport.description)
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
