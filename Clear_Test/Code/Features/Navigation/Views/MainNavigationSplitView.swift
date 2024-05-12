//
//  MainNavigationSplitView.swift
//  Clear_Test
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import SwiftUI

struct MainNavigationSplitView<ViewModel: DashboardViewModelInterface>: View {
    
    // MARK: - Variable
    @ObservedObject var viewModel: ViewModel
    @State private var visibility: NavigationSplitViewVisibility = .all
    @State private var selectedView: MainNavigationPaths? = .Home
    
    var body: some View {
        NavigationSplitView(columnVisibility: $visibility) {
            MainNavigationSideBarView(selectedMainNav: $selectedView)
        } detail: {
            MainNavigationDetailView<ViewModel>(selectedView: $selectedView)
                .environmentObject(viewModel)
        }
        .navigationSplitViewStyle(.balanced)
        .onAppear {
            viewModel.fetchCreditData()
        }
    }
}

#Preview {
    MainNavigationSplitView<StubDashboardViewModel>(viewModel: StubDashboardViewModel())
}
