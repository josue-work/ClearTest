//
//  CircularView.swift
//  Clear_Test
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import SwiftUI

struct CircularView<CircularViewDataModel: CircularViewInterface>: View {
    @EnvironmentObject var data: CircularViewDataModel
    @State var size: CGFloat = 250
    
    // MARK: - View
    var body: some View {
        VStack {
            Text(LocalizedStringKey("dashboard_title_part_one"))
                .bold()
                .foregroundStyle(.primary)
                .lineLimit(1)
                .minimumScaleFactor(0.3)
            if let score = data.creditScore?.description {
                Text(score)
                    .font(.largeTitle)
                    .foregroundStyle(.yellow)
                    .padding(.bottom, 3)
                    .padding(.top, 3)
            } else {
                Text("---")
                    .font(.largeTitle)
                    .foregroundStyle(.yellow)
                    .padding(.bottom, 3)
                    .padding(.top, 3)
            }
            if let maxScore = data.creditMaxScore?.description {
                Text(LocalizedStringKey("dashboard_title_part_two"))
                    .bold()
                    .foregroundStyle(.primary)
                +
                Text(" \(maxScore)")
                    .bold()
                    .foregroundStyle(.primary)
            } else {
                Text("---")
                    .bold()
                    .foregroundStyle(.primary)
            }
        }
        .contentShape(Circle())
        .overlay(
            Circle()
                .stroke(.primary, lineWidth: 1)
                .frame(width: size, height: size)
        )
    }
}

#Preview {
    CircularView<StubCircularViewModel>()
        .environmentObject(StubCircularViewModel())
}
