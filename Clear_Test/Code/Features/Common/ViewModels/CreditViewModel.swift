//
//  CreditViewModel.swift
//  Clear_Test
//
//  This is the creditViewModel
//  It is used to load, store, and publish the data fetched from the provided endpoint
//  It makes use of the created service to fetch the data
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import Foundation
import Combine

final class CreditViewModel<T: URLSessionProtocol>: ObservableObject {
    
    // MARK: - Variable
    private var cancellables = Set<AnyCancellable>()
    @Published var creditData: CreditModel?
    @Published var creditScore: Int?
    @Published var creditMaxScore: Int?
    @Published var creditReportInfo: CreditReportInfoModel?
    @Published var coachingSummary: CoachingSummaryModel?
    @Published var error: Error?
    private let creditDataService: CreditDataService<T>
    
    
    init(creditDataService: CreditDataService<T>) {
        self.creditDataService = creditDataService
    }
}

extension CreditViewModel: CreditViewModelInterface, CreditReportInfoViewInterface, CoachingSummaryViewInterface {
    
    // MARK: - Network calls
    // This function fetches the credit data information
    func fetchCreditData() -> AnyPublisher<CreditModel, NetworkError>? {
        
        let response = creditDataService.get(ForEndpoint: .creditReportDetails, WithDataType: CreditModel.self)
        response
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.fillError(completion: completion)
            } receiveValue: { [weak self] creditData in
                self?.fillData(creditData: creditData)
            }
            .store(in: &cancellables)
        
        return response
    }
    
    func fillError(completion: Subscribers.Completion<NetworkError>) {
        switch completion {
        case .failure(let error):
            self.error = error
//            Log<CreditViewModel>.logger.trace("Error is \(error.localizedDescription)")
        case .finished:
//            Log<CreditViewModel>.logger.trace("Finished")
            break
        }
    }
    
    func fillData(creditData: CreditModel) {
        self.creditData = creditData
        if let creditScore = creditData.creditReportInfo?.score {
            self.creditScore = creditScore
        }
        if let creditMaxScore = creditData.creditReportInfo?.maxScoreValue {
            self.creditMaxScore = creditMaxScore
        }
        if let creditReportInfo = creditData.creditReportInfo {
            self.creditReportInfo = creditReportInfo
        }
        if let coachingSummary = creditData.coachingSummary {
            self.coachingSummary = coachingSummary
        }
        self.error = nil
    }
}
