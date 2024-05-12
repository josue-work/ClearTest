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

    var urlSession: URLSessionMock?
    var creditDataService: CreditDataService<URLSessionMock>?

    var publisher: AnyCancellable?
    var response: Publishers.ReceiveOn<AnyPublisher<CreditModel, NetworkError>, DispatchQueue>?

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
    
    func testSuccessfullURLResponseWithStubs() {
        urlSession = URLSessionMock()
        creditDataService = CreditDataService(session: urlSession!)

        response = creditDataService?.get(ForEndpoint: .creditReportDetails, WithDataType: CreditModel.self)
            .receive(on: DispatchQueue.main)

        let expectation = self.expectation(description: "Test Succesful Responses")
        publisher = response?.sink(receiveCompletion: { _ in
        // Failure case not considered here
        }, receiveValue: { creditData in
            let creditStubs = StubCreditDetailModel()
            XCTAssertEqual(creditStubs.creditData, creditData)
    
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
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
        }, receiveValue: { creditData in
            XCTFail("failure URLSession: \(creditData)")
            expectation.fulfill()
        })
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
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
        }, receiveValue: { creditData in
            XCTFail("failure URLSession: \(creditData)")
        })
        
        waitForExpectations(timeout: 5, handler: nil)
    }

}
