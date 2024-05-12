//
//  Clear_TestUITests.swift
//  Clear_TestUITests
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import XCTest

final class Clear_TestUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    // MARK: - UI Test functions
    // This will check if we are able to access the credit report info in the details view
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
    
    // This will test when the API returns a data with credit report info missing
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
    
    // This will check if we are able to access the coaching summary access
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
    
    // This will test when the API returns a data with coachingSummary missing
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
    
    // This will test when we receive a bad URL error via stubbing the error
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
    
    // This will test when we are unable to decode network correctly via stubbing the error
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
    
    // This will test when we receivevd a bad status code through the network error
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
    
    // This will test when an unknown error occurs that is not part of NetworkError enums we created - I took some shortcut here.
    func testErrorCustomError() throws {
        let device = XCUIDevice.shared
        device.orientation = .portrait
        
        let app = XCUIApplication()
        
        app.launchArguments = ["UITEST-customErrorDomain"]
        app.launch()
        sleep(1)
        // Here I am testing for the bottom text as I could not come up with the text label composition aboce correctly
        let errorText = app.staticTexts["Please contact developer @ josuecizungu@gmail.com"]
        XCTAssertTrue(errorText.exists)
    }
    
    // This will test When an unknown error occured and make sure the error messsage is displayed correctly
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
