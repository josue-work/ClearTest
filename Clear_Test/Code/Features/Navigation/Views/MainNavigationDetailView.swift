//
//  MainNavigationDetailView.swift
//  Clear_Test
//
//  This is a kind of a hidden menu that is not really shown unless we are in landscape mode
//  This class is used to acually load the views linked to it
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import SwiftUI

struct MainNavigationDetailView<ViewModel: CreditViewModelInterface & CreditModelInterface>: View {
    
    // MARK: - Variables
    @EnvironmentObject var viewModel: ViewModel
    @Binding var selectedView: MainNavigationPaths?
    @State private var presentedPath = NavigationPath()
    
    // MARK: - Body view
    var body: some View {
        NavigationStack(path: $presentedPath) {
            Group {
                if let selectedView {
                    switch selectedView {
                    case .Home:
                        DashboardView<ViewModel>(selectedView: $selectedView)
                            .environmentObject(viewModel)
                    case .Details:
                        CreditDetailView<ViewModel>(selectedView: $selectedView)
                            .environmentObject(viewModel)
                    }
                } else {
                    Text(LocalizedStringKey("nothing_selected"))
                }
            }
            .onChange(of: selectedView, {
                presentedPath = NavigationPath()
            })
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MainNavigationDetailView<StubCreditViewModel>(selectedView: {
        @State var selectedView: MainNavigationPaths?
        return $selectedView
    }())
        .environmentObject(StubCreditViewModel())
}
