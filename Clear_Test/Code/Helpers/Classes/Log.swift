//
//  Log.swift
//  Clear_Test
//
//  Created by Josue Muhiri Cizungu on 2024/05/13.
//

import Foundation
import os

final class Log<T: AnyObject> {
    static var logger: Logger {
        return Logger(subsystem: Bundle.main.bundleIdentifier!,
                      category: String(describing: T.self))
    }
}
