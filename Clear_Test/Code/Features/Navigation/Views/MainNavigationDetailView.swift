//
//  MainNavigationDetailView.swift
//  Clear_Test
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import SwiftUI

struct MainNavigationDetailView<ViewModel: DashboardViewModelInterface & CreditModelInterface>: View {
    @EnvironmentObject var viewModel: ViewModel
    @Binding var selectedView: MainNavigationPaths?
    @State private var presentedPath = NavigationPath()
    
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
    MainNavigationDetailView<StubDashboardViewModel>(selectedView: {
        @State var selectedView: MainNavigationPaths?
        return $selectedView
    }())
        .environmentObject(StubDashboardViewModel())
}
