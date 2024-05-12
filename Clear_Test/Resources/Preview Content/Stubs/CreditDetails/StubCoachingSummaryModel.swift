//
//  StubCoachingSummaryModel.swift
//  Clear_Test
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import Foundation

class StubCoachingSummaryModel: CoachingSummaryViewInterface {
    var coachingSummary: CoachingSummaryModel?
    init() {
        self.coachingSummary = CoachingSummaryModel(activeTodo: false,
                                                    activeChat: true,
                                                    numberOfTodoItems: 0,
                                                    numberOfCompletedTodoItems: 0,
                                                    selected: true)
    }
}
