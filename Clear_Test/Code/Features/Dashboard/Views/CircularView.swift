//
//  CircularView.swift
//  Clear_Test
//
//  This is a subview used by the dashboard
//  This creates the circle view with the score rating
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import SwiftUI

struct CircularView<CircularViewDataModel: CircularViewInterface>: View {
    
    // MARK: - Variables
    @EnvironmentObject private var data: CircularViewDataModel
    @State private var size: CGFloat = 250
    @State private var circleStart: CGFloat = 0.0
    @State private var circleEnd: CGFloat = 0.0
    @State private var rotatingDegree: Angle = .degrees(0)
    
    // MARK: - Body view
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .fill(.gray)
                .shadow(radius: 5)
            
            Circle()
                .trim(from: circleStart, to: circleEnd)
                .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round))
                .fill(.blue)
                .rotationEffect(rotatingDegree)
                .onChange(of: data.creditMaxScore, {
                    // I use on change so when the view model publishes data.creditScoreMax, we can trigger the animation here
                    let calculatedPercentage: CGFloat
                    if let creditScore = data.creditScore, let creditMaxScore = data.creditMaxScore {
                        calculatedPercentage = CGFloat(creditScore) / CGFloat(creditMaxScore)
                        resetAnimation()
                        animateLoaderWith(newCircleEnd: calculatedPercentage)
                    }
                })
            
            VStack {
                Text(LocalizedStringKey("dashboard_title_part_one"))
                    .bold()
                    .foregroundStyle(.primary)
                    .lineLimit(1)
                    .minimumScaleFactor(0.3)
                Text("\(data.creditScore?.description ?? "---")")
                    .font(.largeTitle)
                    .foregroundStyle(.yellow)
                    .padding(.bottom, 3)
                    .padding(.top, 3)
                
                Text(LocalizedStringKey("dashboard_title_part_two"))
                    .bold()
                    .foregroundStyle(.primary)
                +
                Text(" \(data.creditMaxScore?.description ?? "---")")
                    .bold()
                    .foregroundStyle(.primary)
            }
        }
        .frame(width: size, height: size)
        .onAppear() {
            // This is mostly for after the view is shown, when the user navigates back to this view - the circleEnd can be calculated again to return to correct value instead of the initiala value 0.0
            if let creditScore = data.creditScore, let creditMaxScore = data.creditMaxScore {
                circleEnd = CGFloat(creditScore) / CGFloat(creditMaxScore)
            }
        }
        
    }
    
    // MARK: - Functions
    private func animateLoaderWith(newCircleEnd: CGFloat) {
        withAnimation(.spring(response: 0.75)) {
            circleEnd = newCircleEnd
            rotatingDegree = .degrees(360)
        }
    }
    
    private func resetAnimation() {
        circleEnd = 0
        rotatingDegree = .degrees(0)
    }
}

#Preview {
    CircularView<StubCircularViewModel>()
        .environmentObject(StubCircularViewModel())
}
