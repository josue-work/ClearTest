//
//  MainNavigationSideBarView.swift
//  Clear_Test
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import SwiftUI

struct MainNavigationSideBarView: View {
    @Binding var selectedMainNav: MainNavigationPaths?
    
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
