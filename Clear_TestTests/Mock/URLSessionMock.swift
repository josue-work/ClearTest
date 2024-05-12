//
//  URLSessionMock.swift
//  Clear_TestTests
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import Foundation
import Combine
@testable import Clear_Test

class URLSessionMock: URLSessionProtocol {

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

    func response(for request: URLRequest) -> AnyPublisher<APIResponse, URLError> {
        let response = HTTPURLResponse(
            url: request.url!,
            statusCode: 200,
            httpVersion: "HTTP/1.1",
            headerFields: nil)!

//        let file = Bundle(for: type(of: self)).path(forResource: jsonName, ofType: nil) ?? ""

//        let url = URL(fileURLWithPath: file)

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
