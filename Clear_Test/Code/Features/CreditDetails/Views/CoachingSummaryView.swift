//
//  CoachingSummaryView.swift
//  Clear_Test
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import SwiftUI

struct CoachingSummaryView<CoachingSummaryData: CoachingSummaryViewInterface>: View {
    @EnvironmentObject private var data: CoachingSummaryData
    
    var body: some View {
        Group {
            if let coachingSummary = data.coachingSummary {
                List {
                    if let activeTodo = coachingSummary.activeTodo {
                        CreditDetailListItem(keyString: String(localized: "active_TODO"), valueString: activeTodo.description)
                    }
                    if let activeChat = coachingSummary.activeChat {
                        CreditDetailListItem(keyString: String(localized: "active_chat"), valueString: activeChat.description)
                    }
                    if let numberOfTodoItems = coachingSummary.numberOfTodoItems {
                        CreditDetailListItem(keyString: String(localized: "number_of_TODO_items"), valueString: numberOfTodoItems.description)
                    }
                    if let numberOfCompletedTodoItems = coachingSummary.numberOfCompletedTodoItems {
                        CreditDetailListItem(keyString: String(localized: "completed_TODO_items"), valueString: numberOfCompletedTodoItems.description)
                    }
                    if let selected = coachingSummary.selected {
                        CreditDetailListItem(keyString: String(localized: "selected"), valueString: selected.description)
                    }
                }
            } else {
                Text(String(localized: "no_data"))
            }
        }
    }
}

#Preview {
    CoachingSummaryView<StubCoachingSummaryModel>()
        .environmentObject(StubCoachingSummaryModel())
}
