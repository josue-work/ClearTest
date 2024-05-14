//
//  Clear_TestApp.swift
//  Clear_Test
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import SwiftUI

@main
struct Clear_TestApp: App {
    
    init() {
        if ProcessInfo.processInfo.environment["DISABLE_ANIMATIONS"] == "1" {
            UIView.setAnimationsEnabled(false)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            // We decided to use the app arguments that we add before running the UITest to stub values for each specific tests.
            // We run the app here using a stubbed creditViewModel with the correct argument
            if ProcessInfo.processInfo.arguments.contains("UITEST-badURL"){
                MainNavigationSplitView<StubCreditViewModel>(viewModel: StubCreditViewModel(error: NetworkError.badURL))
            } else if ProcessInfo.processInfo.arguments.contains("UITEST-decode"){
                MainNavigationSplitView<StubCreditViewModel>(viewModel: StubCreditViewModel(error: NetworkError.decode))
            } else if ProcessInfo.processInfo.arguments.contains("UITEST-reponseError"){
                MainNavigationSplitView<StubCreditViewModel>(viewModel: StubCreditViewModel(error: NetworkError.responseError(StatusCode: nil)))
            } else if ProcessInfo.processInfo.arguments.contains("UITEST-unknown"){
                MainNavigationSplitView<StubCreditViewModel>(viewModel: StubCreditViewModel(error: NetworkError.unknown))
            } else if ProcessInfo.processInfo.arguments.contains("UITEST-noCreditReportInfo"){
                MainNavigationSplitView<StubCreditViewModel>(viewModel: StubCreditViewModel(emptyCreditReportInfo: true, emptyCoachingSummary: false))
            } else if ProcessInfo.processInfo.arguments.contains("UITEST-noCoachingSummary"){
                MainNavigationSplitView<StubCreditViewModel>(viewModel: StubCreditViewModel(emptyCreditReportInfo: false, emptyCoachingSummary: true))
            } else if ProcessInfo.processInfo.arguments.contains("UITEST-customErrorDomain"){
                MainNavigationSplitView<StubCreditViewModel>(viewModel: StubCreditViewModel(error: NSError(domain: "my custom error", code: -1)))
            } else if ProcessInfo.processInfo.arguments.contains("UITEST") {
                MainNavigationSplitView<StubCreditViewModel>(viewModel: StubCreditViewModel())
            } else {
                MainNavigationSplitView<CreditViewModel<URLSession>>(viewModel: CreditViewModel(creditDataService: CreditDataService(session: .shared)))
            }
        }
    }
}
