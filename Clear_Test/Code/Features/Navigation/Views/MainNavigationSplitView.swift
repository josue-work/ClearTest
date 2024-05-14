//
//  MainNavigationSplitView.swift
//  Clear_Test
//
//  This is our main view that loaded containing the NavigationSplitView
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import SwiftUI

struct MainNavigationSplitView<ViewModel: CreditViewModelInterface>: View {
    
    // MARK: - Variable
    @ObservedObject var viewModel: ViewModel
    @State private var visibility: NavigationSplitViewVisibility = .detailOnly
    @State private var selectedView: MainNavigationPaths? = .Home
    
    // MARK: - Body view
    var body: some View {
        NavigationSplitView(columnVisibility: $visibility) {
            MainNavigationSideBarView(selectedMainNav: $selectedView)
        } detail: {
            MainNavigationDetailView<ViewModel>(selectedView: $selectedView)
                .environmentObject(viewModel)
        }
        .navigationSplitViewStyle(.balanced)
        .onAppear {
            _ = viewModel.fetchCreditData()
        }
    }
}

#Preview {
    MainNavigationSplitView<StubCreditViewModel>(viewModel: StubCreditViewModel())
}
