//
//  CoachingSummaryView.swift
//  Clear_Test
//
//  This view has the list for the coaching summary model
//  within the big credit model
// 
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import SwiftUI

struct CoachingSummaryView<CoachingSummaryData: CoachingSummaryViewInterface>: View {
    
    // MARK: - Variables
    @EnvironmentObject private var data: CoachingSummaryData
    
    // MARK: - Body View
    var body: some View {
        Group {
            if let coachingSummary = data.coachingSummary {
                List {
                    if let activeTodo = coachingSummary.activeTodo {
                        ListItem(keyString: String(localized: "active_TODO"), valueString: activeTodo.description)
                    }
                    if let activeChat = coachingSummary.activeChat {
                        ListItem(keyString: String(localized: "active_chat"), valueString: activeChat.description)
                    }
                    if let numberOfTodoItems = coachingSummary.numberOfTodoItems {
                        ListItem(keyString: String(localized: "number_of_TODO_items"), valueString: numberOfTodoItems.description)
                    }
                    if let numberOfCompletedTodoItems = coachingSummary.numberOfCompletedTodoItems {
                        ListItem(keyString: String(localized: "completed_TODO_items"), valueString: numberOfCompletedTodoItems.description)
                    }
                    if let selected = coachingSummary.selected {
                        ListItem(keyString: String(localized: "selected"), valueString: selected.description)
                    }
                }
            } else {
                Text(String(localized: "no_data"))
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(LocalizedStringKey("coaching_summary"))
                    .foregroundColor(.white)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CoachingSummaryView<StubCoachingSummaryModel>()
        .environmentObject(StubCoachingSummaryModel())
}
