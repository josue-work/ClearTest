//
//  Clear_TestApp.swift
//  Clear_Test
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import SwiftUI

@main
struct Clear_TestApp: App {
    
    var body: some Scene {
        WindowGroup {
            if ProcessInfo.processInfo.arguments.contains("UITEST-badURL"){
                MainNavigationSplitView<StubDashboardViewModel>(viewModel: StubDashboardViewModel(error: NetworkError.badURL))
            } else if ProcessInfo.processInfo.arguments.contains("UITEST-decode"){
                MainNavigationSplitView<StubDashboardViewModel>(viewModel: StubDashboardViewModel(error: NetworkError.decode))
            } else if ProcessInfo.processInfo.arguments.contains("UITEST-reponseError"){
                MainNavigationSplitView<StubDashboardViewModel>(viewModel: StubDashboardViewModel(error: NetworkError.responseError(StatusCode: nil)))
            } else if ProcessInfo.processInfo.arguments.contains("UITEST-unknown"){
                MainNavigationSplitView<StubDashboardViewModel>(viewModel: StubDashboardViewModel(error: NetworkError.unknown))
            } else if ProcessInfo.processInfo.arguments.contains("UITEST-noCreditReportInfo"){
                MainNavigationSplitView<StubDashboardViewModel>(viewModel: StubDashboardViewModel(emptyCreditReportInfo: true, emptyCoachingSummary: false))
            } else if ProcessInfo.processInfo.arguments.contains("UITEST-noCoachingSummary"){
                MainNavigationSplitView<StubDashboardViewModel>(viewModel: StubDashboardViewModel(emptyCreditReportInfo: false, emptyCoachingSummary: true))
            } else if ProcessInfo.processInfo.arguments.contains("UITEST") {
                MainNavigationSplitView<StubDashboardViewModel>(viewModel: StubDashboardViewModel())
            } else {
                MainNavigationSplitView<CreditViewModel<URLSession>>(viewModel: CreditViewModel(creditDataService: CreditDataService(session: .shared)))
            }
        }
    }
}
