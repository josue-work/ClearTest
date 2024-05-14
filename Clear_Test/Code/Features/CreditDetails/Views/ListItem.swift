//
//  ListItem.swift
//  Clear_Test
//
//  This is used by the list to display each `line` item
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import SwiftUI

struct ListItem: View {
    
    // MARK: - Variables
    @State private var keyString: String
    @State private var valueString: String
    
    init(keyString: String, valueString: String) {
        self.keyString = keyString
        self.valueString = valueString
    }
    
    // MARK: - Body View
    var body: some View {
        HStack {
            Text("\(keyString):")
                .frame(alignment: .leading)
            Spacer()
            Text(valueString)
                .frame(alignment: .trailing)
        }
    }
}

#Preview {
    ListItem(keyString: "---", valueString: "---")
}
