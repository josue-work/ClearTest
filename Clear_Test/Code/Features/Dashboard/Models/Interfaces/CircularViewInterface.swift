//
//  CircularViewInterface.swift
//  Clear_Test
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import Foundation

protocol CircularViewInterface: ObservableObject {
    var creditScore: Int? { get }
    var creditMaxScore: Int? { get }
}
