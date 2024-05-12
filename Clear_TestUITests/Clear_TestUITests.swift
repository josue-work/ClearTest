//
//  Clear_TestUITests.swift
//  Clear_TestUITests
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import XCTest

final class Clear_TestUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreditReportInfoPageAccess() throws {
        let device = XCUIDevice.shared
        device.orientation = .portrait

        let app = XCUIApplication()
        
        app.launchArguments = ["UITEST"]
        app.launch()
        sleep(1)
        let detailsButton = app.staticTexts["Your credit score is"]
        XCTAssertTrue(detailsButton.exists)
        detailsButton.tap()
        sleep(1)
        let creditReportInfoButton = app.staticTexts["Credit Report Info"]
        XCTAssertTrue(creditReportInfoButton.exists)
        creditReportInfoButton.tap()
        sleep(1)
        let clientReference = app.staticTexts["Client Reference:"]
        XCTAssertTrue(clientReference.exists)
        let clientReferenceValue = app.staticTexts["CS-SED-634897-708782"]
        XCTAssertTrue(clientReferenceValue.exists)
    }
    
    func testNoCreditReportInfo() throws {
        let device = XCUIDevice.shared
        device.orientation = .portrait

        let app = XCUIApplication()
        
        app.launchArguments = ["UITEST-noCreditReportInfo"]
        app.launch()
        sleep(1)
        let detailsButton = app.staticTexts["Your credit score is"]
        XCTAssertTrue(detailsButton.exists)
        detailsButton.tap()
        sleep(1)
        let creditReportInfoButton = app.staticTexts["Credit Report Info"]
        XCTAssertFalse(creditReportInfoButton.exists)
    }
    
    func testCoachingSummaryAccess() throws {
        let device = XCUIDevice.shared
        device.orientation = .portrait
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITEST"]
        app.launch()
        sleep(1)
        let detailsButton = app.staticTexts["Your credit score is"]
        XCTAssertTrue(detailsButton.exists)
        detailsButton.tap()
        sleep(1)
        let coachingSummaryButton = app.staticTexts["Coaching Summary"]
        XCTAssertTrue(coachingSummaryButton.exists)
        coachingSummaryButton.tap()
        sleep(2)
        let activeTODO = app.staticTexts["Active TODO:"]
        XCTAssertTrue(activeTODO.exists)
    }
    
    func testNoCoachingSummary() throws {
        let device = XCUIDevice.shared
        device.orientation = .portrait
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITEST-noCoachingSummary"]
        app.launch()
        sleep(1)
        let detailsButton = app.staticTexts["Your credit score is"]
        XCTAssertTrue(detailsButton.exists)
        detailsButton.tap()
        sleep(1)
        let coachingSummaryButton = app.staticTexts["Coaching Summary"]
        XCTAssertFalse(coachingSummaryButton.exists)
    }
    
    func testErrorBadURL() throws {
        let device = XCUIDevice.shared
        device.orientation = .portrait
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITEST-badURL"]
        app.launch()
        sleep(1)
        let errorText = app.staticTexts["URL is invalid"]
        XCTAssertTrue(errorText.exists)
    }

    func testErrorDecode() throws {
        let device = XCUIDevice.shared
        device.orientation = .portrait
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITEST-decode"]
        app.launch()
        sleep(1)
        let errorText = app.staticTexts["Unable to decode the response received"]
        XCTAssertTrue(errorText.exists)
    }
    
    func testErrorResponseError() throws {
        let device = XCUIDevice.shared
        device.orientation = .portrait
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITEST-reponseError"]
        app.launch()
        sleep(1)
        let errorText = app.staticTexts["Network Error:\t"]
        XCTAssertTrue(errorText.exists)
    }
    
    func testErrorUnknown() throws {
        let device = XCUIDevice.shared
        device.orientation = .portrait
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITEST-unknown"]
        app.launch()
        sleep(1)
        let errorText = app.staticTexts["Unknown Error"]
        XCTAssertTrue(errorText.exists)
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric(waitUntilResponsive: true)]) {
//                XCUIApplication().launch()
//            }
            let device = XCUIDevice.shared
            device.orientation = .portrait
            let options = XCTMeasureOptions()
            options.iterationCount = 1

            let launchMetric = XCTApplicationLaunchMetric(waitUntilResponsive: true)
            measure(metrics: [launchMetric],
                    options: options) {
                XCUIApplication().launch()
            }
        }
    }
}
