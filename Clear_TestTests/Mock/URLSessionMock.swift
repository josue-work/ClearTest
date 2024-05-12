//
//  URLSessionMock.swift
//  Clear_TestTests
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import Foundation
import Combine
@testable import Clear_Test

// This is used to Mock URLSession using the protocol created
class URLSessionMock: URLSessionProtocol {

    // This is the json string used to decode the data type with the status code
    // MARK: - Variables
    var jsonName =
"""
{
    "accountIDVStatus": "PASS",
    "creditReportInfo": {
        "score": 414,
        "scoreBand": 5,
        "clientRef": "CS-SED-634897-708782",
        "status": "MATCH",
        "maxScoreValue": 850,
        "minScoreValue": 0,
        "monthsSinceLastDefaulted": -1,
        "hasEverDefaulted": false,
        "monthsSinceLastDelinquent": 1,
        "hasEverBeenDelinquent": true,
        "percentageCreditUsed": 44,
        "percentageCreditUsedDirectionFlag": 1,
        "changedScore": 0,
        "currentShortTermDebt": 13758,
        "currentShortTermNonPromotionalDebt": 13758,
        "currentShortTermCreditLimit": 30600,
        "currentShortTermCreditUtilisation": 44,
        "changeInShortTermDebt": 549,
        "currentLongTermDebt": 24682,
        "currentLongTermNonPromotionalDebt": 24682,
        "currentLongTermCreditLimit": null,
        "currentLongTermCreditUtilisation": null,
        "changeInLongTermDebt": -327,
        "numPositiveScoreFactors": 9,
        "numNegativeScoreFactors": 0,
        "equifaxScoreBand": 4,
        "equifaxScoreBandDescription": "Excellent",
        "daysUntilNextReport": 9
    },
    "dashboardStatus": "PASS",
    "personaType": "INEXPERIENCED",
    "coachingSummary": {
        "activeTodo": false,
        "activeChat": true,
        "numberOfTodoItems": 0,
        "numberOfCompletedTodoItems": 0,
        "selected": true
    },
    "augmentedCreditScore": null
}
"""
    var statusCode = 200
    
    // MARK: - Mocked function
    // Mocking the response function
    func response(for request: URLRequest) -> AnyPublisher<APIResponse, URLError> {
        let response = HTTPURLResponse(
            url: request.url!,
            statusCode: statusCode,
            httpVersion: "HTTP/1.1",
            headerFields: nil)!

        guard let data = jsonName.data(using: .utf8) else {
            return Just((data: Data(), response: response))
                .setFailureType(to: URLError.self)
                .eraseToAnyPublisher()
        }

        return Just((data: data, response: response))
            .setFailureType(to: URLError.self)
            .eraseToAnyPublisher()
    }
}
