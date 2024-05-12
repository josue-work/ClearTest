//
//  Clear_TestUITestsLaunchTests.swift
//  Clear_TestUITests
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import XCTest

final class Clear_TestUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
