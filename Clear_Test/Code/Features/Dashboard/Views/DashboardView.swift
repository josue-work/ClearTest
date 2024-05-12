//
//  DashboardView.swift
//  Clear_Test
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import SwiftUI

struct DashboardView<ViewModel: DashboardViewModelInterface>: View {
    @EnvironmentObject var viewModel: ViewModel
    @Binding var selectedView: MainNavigationPaths?
    @State private var presentedPath = NavigationPath()
    
    // MARK: - View
    var body: some View {
        
        NavigationStack(path: $presentedPath) {
            if let _ = viewModel.error {
                ErrorView<ViewModel>()
                    .environmentObject(viewModel)
            } else {
//                NavigationLink {
//                    selectedView = .Details
//                } label: {
                    CircularView<ViewModel>()
                        .environmentObject(viewModel)
                        .onTapGesture {
                            selectedView = .Details
                        }
                        .tag("CircularView")
//                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(LocalizedStringKey("dashboard_title"))
                    .foregroundColor(.white)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.black, for: .automatic)
        .toolbarBackground(.visible, for: .navigationBar)
        .foregroundColor(.primary)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    DashboardView<StubDashboardViewModel>(selectedView: {
        @State var selectedMainNav: MainNavigationPaths?
         return $selectedMainNav
     }())
        .environmentObject(StubDashboardViewModel())
}
