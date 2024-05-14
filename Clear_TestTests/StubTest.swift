//
//  StubTest.swift
//  Clear_TestTests
//
//  This is just making sure my stubbing is working as expected
//
//  Created by Josue Muhiri Cizungu on 2024/05/14.
//

import XCTest
@testable import Clear_Test

final class StubTest: XCTestCase {

    func testCreditModelStub() {
        let stubCreditModel = StubCreditModel()
        XCTAssertEqual(stubCreditModel.coachingSummary, StubCoachingSummaryModel().coachingSummary)
        XCTAssertEqual(stubCreditModel.creditReportInfo, StubCreditReportInfoModel().creditReportInfo)
        XCTAssertEqual(stubCreditModel.creditData?.personaType, "INEXPERIENCED")
        XCTAssertEqual(stubCreditModel.creditData?.accountIDVStatus, "PASS")
        XCTAssertEqual(stubCreditModel.creditData?.dashboardStatus, "PASS")
        XCTAssertNil(stubCreditModel.creditData?.augmentedCreditScore)
    }
    
    func testCreditViewModelStub() {
        let creditViewModel = StubCreditViewModel()
        XCTAssertEqual(creditViewModel.creditData, StubCreditModel().creditData)
        XCTAssertNil(creditViewModel.error)
    }
    
    func testCreditViewModelStubError() {
        let creditViewModel = StubCreditViewModel(error: NetworkError.unknown)
        XCTAssertEqual(creditViewModel.error as? NetworkError, NetworkError.unknown)
        XCTAssertNil(creditViewModel.creditData)
    }
    
    func testCreditViewModelStubForUI() {
        let stubCreditModel = StubCreditViewModel(emptyCreditReportInfo: true, emptyCoachingSummary: true)
        XCTAssertNil(stubCreditModel.coachingSummary)
        XCTAssertNil(stubCreditModel.creditReportInfo)
        XCTAssertEqual(stubCreditModel.creditData?.personaType, "INEXPERIENCED")
        XCTAssertEqual(stubCreditModel.creditData?.accountIDVStatus, "PASS")
        XCTAssertEqual(stubCreditModel.creditData?.dashboardStatus, "PASS")
        XCTAssertNil(stubCreditModel.creditData?.augmentedCreditScore)
    }
    
    func testCircularViewModelStub() {
        let circularstub = StubCircularViewModel()
        XCTAssertEqual(circularstub.creditScore, 327)
        XCTAssertEqual(circularstub.creditMaxScore, 700)
    }

}
