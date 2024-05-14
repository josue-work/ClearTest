//
//  CreditDetailView.swift
//  Clear_Test
//
//  This view has the list for the credit model
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import SwiftUI

struct CreditDetailView<CreditDataModel: CreditModelInterface & CreditReportInfoViewInterface & CoachingSummaryViewInterface>: View {
    
    
    // MARK: - Variables
    @EnvironmentObject private var data: CreditDataModel
    @Binding var selectedView: MainNavigationPaths?
    @State private var presentedPath: NavigationPath = NavigationPath()
    
    // MARK: - Body View
    var body: some View {
        NavigationStack(path: $presentedPath) {
            Group {
                if let creditData = data.creditData {
                    List {
                        if let accountIDVStatus = creditData.accountIDVStatus {
                            ListItem(keyString: String(localized: "account_IDV_status"), valueString: accountIDVStatus.description)
                        }
                        if let _ = creditData.creditReportInfo {
                            NavigationLink(value: DetailsNavigationPaths.CreditReportInfo, label: {
                                Text(LocalizedStringKey("credit_report_info"))
                            })
                        }
                        if let dashboardStatus = creditData.dashboardStatus {
                            ListItem(keyString: String(localized:"dashboard_status"), valueString: dashboardStatus.description)
                        }
                        if let personaType = creditData.personaType {
                            ListItem(keyString: String(localized: "persona_type"), valueString: personaType.description)
                        }
                        if let _ = creditData.coachingSummary {
                            NavigationLink(value: DetailsNavigationPaths.CoachingSummary, label: {
                                Text(String(localized: "coaching_summary"))
                            })
                        }
                        if let augmentedCreditScore = creditData.augmentedCreditScore {
                            ListItem(keyString: String(localized: "augmented_credit_score"), valueString: augmentedCreditScore.description)
                        }
                    }
                    .navigationDestination(for: DetailsNavigationPaths.self) { detailType in
                        switch detailType {
                        case .CoachingSummary:
                            CoachingSummaryView<CreditDataModel>()
                                .environmentObject(data)
                        case .CreditReportInfo:
                            CreditReportInfoView<CreditDataModel>()
                                .environmentObject(data)
                        }
                    }
                } else {
                    Text(String(localized: "no_data"))
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle(String(localized: "detail"))
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        self.selectedView = .Home
                    } label: {
                        Text(String(localized: "back"))
                    }
                }
            }
        }
        .onChange(of: selectedView, {
            presentedPath = NavigationPath()
        })
    }
}

#Preview {
    CreditDetailView<StubCreditModel>(selectedView: {
        @State var selectedView: MainNavigationPaths?
        return $selectedView
    }())
        .environmentObject(StubCreditModel())
}
