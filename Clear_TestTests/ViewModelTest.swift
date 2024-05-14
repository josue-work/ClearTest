//
//  ViewModelTest.swift
//  Clear_TestTests
//
//  Created by Josue Muhiri Cizungu on 2024/05/14.
//

import XCTest
@testable import Clear_Test

final class ViewModelTest: XCTestCase {

    // MARK: - Variables
    var urlSession: URLSessionMock?
    var creditDataService: CreditDataService<URLSessionMock>?

    // MARK: - Unit Test functions
    
    // This will test the view model with a succesful URL response
    func testViewModelSuccessful() {
        urlSession = URLSessionMock()
        creditDataService = CreditDataService(session: urlSession!)
        let viewModel = CreditViewModel(creditDataService: creditDataService!)
        
        let expectation = self.expectation(description: "Test view model Responses")
        
        _ = viewModel.fetchCreditData()?.sink(receiveCompletion: { completion in
        }, receiveValue: { creditData in
            viewModel.fillData(creditData: creditData)
            XCTAssertEqual(viewModel.creditData, creditData)
            XCTAssertEqual(viewModel.creditScore, creditData.creditReportInfo?.score)
            XCTAssertEqual(viewModel.creditMaxScore, creditData.creditReportInfo?.maxScoreValue)
            XCTAssertEqual(viewModel.creditReportInfo, creditData.creditReportInfo)
            XCTAssertEqual(viewModel.coachingSummary, creditData.coachingSummary)
            XCTAssertNil(viewModel.error)
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testViewModelFailure() {
        urlSession = URLSessionMock()
        urlSession?.jsonName = "this will not work"
        creditDataService = CreditDataService(session: urlSession!)
        let viewModel = CreditViewModel(creditDataService: creditDataService!)
        
        let expectation = self.expectation(description: "Test view model Responses")
        
        _ = viewModel.fetchCreditData()?.sink(receiveCompletion: { completion in
            viewModel.fillError(completion: completion)
            XCTAssertEqual(viewModel.error as? NetworkError, NetworkError.decode)
            expectation.fulfill()
        }, receiveValue: { creditData in
        })
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    

}
