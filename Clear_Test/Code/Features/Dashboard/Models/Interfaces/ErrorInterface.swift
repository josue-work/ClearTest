//
//  ErrorInterface.swift
//  Clear_Test
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import Foundation

protocol ErrorInterface: ObservableObject {
    var error: Error? { get }
}
