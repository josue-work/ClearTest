//
//  MainNavigationSideBarView.swift
//  Clear_Test
//
//  This is a kind of a hidden menu that is not really shown unless we are in landscape mode
//  This class is used to load the navigation link
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import SwiftUI

struct MainNavigationSideBarView: View {
    
    // MARK: - Variables
    @Binding var selectedMainNav: MainNavigationPaths?
    
    // MARK: - Body view
    var body: some View {
        List(selection: $selectedMainNav) {
            NavigationLink(value: MainNavigationPaths.Home, label: {
                Text(String(localized: "home"))
            })
            NavigationLink(value: MainNavigationPaths.Details, label: {
                Text(String(localized: "details"))
            })
        }
    }
}

#Preview {
    MainNavigationSideBarView(selectedMainNav: {
       @State var selectedMainNav: MainNavigationPaths?
        return $selectedMainNav
    }())
}
