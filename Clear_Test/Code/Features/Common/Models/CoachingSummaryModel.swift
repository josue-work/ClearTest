//
//  CoachingSummaryModel.swift
//  Clear_Test
//
//  Model for coaching summary inside Credit report model from API
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import Foundation

struct CoachingSummaryModel: Codable, Hashable, Equatable {
    var activeTodo: Bool?
    var activeChat: Bool?
    var numberOfTodoItems: Int?
    var numberOfCompletedTodoItems: Int?
    var selected: Bool?
}
