//
//  CreditDataServiceTest.swift
//  Clear_TestTests
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import Foundation
import XCTest
import Combine
@testable import Clear_Test

class CreditDataServiceTest: XCTestCase {

    // MARK: - Variables
    var urlSession: URLSessionMock?
    var creditDataService: CreditDataService<URLSessionMock>?
    var publisher: AnyCancellable?
    var response: Publishers.ReceiveOn<AnyPublisher<CreditModel, NetworkError>, DispatchQueue>?

    // MARK: - Unit Test functions
    // This will test a successful URL response
    func testSuccessfullURLResponse() {
        urlSession = URLSessionMock()
        creditDataService = CreditDataService(session: urlSession!)

        response = creditDataService?.get(ForEndpoint: .creditReportDetails, WithDataType: CreditModel.self)
            .receive(on: DispatchQueue.main)

        let expectation = self.expectation(description: "Test Succesful Responses")
        publisher = response?.sink(receiveCompletion: { _ in
        // Failure case not considered here
        }, receiveValue: { creditData in
            
            let accountIDVStatus = creditData.accountIDVStatus
            XCTAssertEqual(accountIDVStatus, "PASS")

            let personaType = creditData.personaType

            XCTAssertEqual(personaType, "INEXPERIENCED")

            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    // This will test a successful URL response via the equatable protocol using one of our credit detail model stubs
    func testSuccessfullURLResponseWithStubs() {
        urlSession = URLSessionMock()
        creditDataService = CreditDataService(session: urlSession!)

        response = creditDataService?.get(ForEndpoint: .creditReportDetails, WithDataType: CreditModel.self)
            .receive(on: DispatchQueue.main)

        let expectation = self.expectation(description: "Test Succesful Responses")
        publisher = response?.sink(receiveCompletion: { _ in
        // Failure case not considered here
        }, receiveValue: { creditData in
            let creditStubs = StubCreditModel()
            XCTAssertEqual(creditStubs.creditData, creditData)
    
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    // This will test when the received data via API is unable to corretly decode the information
    func testFailureDecoding() {
        urlSession = URLSessionMock()
        urlSession?.jsonName = "this will not work"
        creditDataService = CreditDataService(session: urlSession!)

        response = creditDataService?.get(ForEndpoint: .creditReportDetails, WithDataType: CreditModel.self)
            .receive(on: DispatchQueue.main)
        let expectation = self.expectation(description: "Test Failure Responses")
        publisher = response?.sink(receiveCompletion: { creditError in
            switch creditError {
            case .finished: break
            case .failure(let error):
                XCTAssertEqual(error, .decode)
                expectation.fulfill()
            }
        }, receiveValue: { _ in
            // succesful case not considered here
        })
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    // This will test when the base url is empty checking the BadURL case
    func testFailureURLResponse() {
        urlSession = URLSessionMock()
        creditDataService = CreditDataService(baseURL: "", session: urlSession!)

        response = creditDataService?.get(ForEndpoint: .creditReportDetails, WithDataType: CreditModel.self)
            .receive(on: DispatchQueue.main)
        let expectation = self.expectation(description: "Test Failure Responses")
        publisher = response?.sink(receiveCompletion: { creditError in
            switch creditError {
            case .finished: break
            case .failure(let error):
                XCTAssertEqual(error, .badURL)
                expectation.fulfill()
            }
        }, receiveValue: { _ in
            // succesful case not considered here
        })
        
        waitForExpectations(timeout: 5, handler: nil)
    }

}
