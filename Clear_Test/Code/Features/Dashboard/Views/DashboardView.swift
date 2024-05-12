//
//  DashboardView.swift
//  Clear_Test
//
//  This is the first view that appears on the app
//  This contains the circle view with the credit score and rating
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import SwiftUI

struct DashboardView<ViewModel: CreditViewModelInterface>: View {
    
    // MARK: - Variables
    @EnvironmentObject var viewModel: ViewModel
    @Binding var selectedView: MainNavigationPaths?
    @State private var presentedPath = NavigationPath()
    
    // MARK: - Body view
    var body: some View {
        
        NavigationStack(path: $presentedPath) {
            if let _ = viewModel.error {
                ErrorView<ViewModel>()
                    .environmentObject(viewModel)
            } else {
                CircularView<ViewModel>()
                    .environmentObject(viewModel)
                    .onTapGesture {
                        selectedView = .Details
                    }
                    .tag("CircularView")
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
    DashboardView<StubCreditViewModel>(selectedView: {
        @State var selectedMainNav: MainNavigationPaths?
         return $selectedMainNav
     }())
        .environmentObject(StubCreditViewModel())
}
