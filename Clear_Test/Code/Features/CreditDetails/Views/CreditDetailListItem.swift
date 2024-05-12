//
//  CreditDetailListItem.swift
//  Clear_Test
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import SwiftUI

struct CreditDetailListItem: View {
    @State var keyString: String = "---"
    @State var valueString: String = "---"
    
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
    CreditDetailListItem()
}
