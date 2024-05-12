//
//  CoachingSummaryModel.swift
//  Clear_Test
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import Foundation

// Model for coaching summary inside Credit report model from API
struct CoachingSummaryModel: Codable, Hashable, Equatable {
    var activeTodo: Bool?
    var activeChat: Bool?
    var numberOfTodoItems: Int?
    var numberOfCompletedTodoItems: Int?
    var selected: Bool?
}
