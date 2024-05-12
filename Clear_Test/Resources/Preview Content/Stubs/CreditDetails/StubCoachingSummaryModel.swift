//
//  StubCoachingSummaryModel.swift
//  Clear_Test
//
//  This is a stubbing class used in previews and UITesting
//  This is used to stub coaching summary model
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
