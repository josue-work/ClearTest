//
//  CreditViewModel.swift
//  Clear_Test
//
//  Created by Josue Muhiri Cizungu on 2024/05/12.
//

import Foundation
import Combine

class CreditViewModel<T: URLSessionProtocol>: ObservableObject {
    
    // MARK: - Variable
    private var cancellables = Set<AnyCancellable>()
    @Published var creditData: CreditModel?
    @Published var creditScore: Int?
    @Published var creditMaxScore: Int?
    @Published var creditReportInfo: CreditReportInfoModel?
    @Published var coachingSummary: CoachingSummaryModel?
    @Published var error: Error?
    var creditDataService: CreditDataService<T>
    
    init(creditDataService: CreditDataService<T>) {
        self.creditDataService = creditDataService
    }
}

extension CreditViewModel: DashboardViewModelInterface, CreditReportInfoViewInterface, CoachingSummaryViewInterface {
    
    // MARK: - Network calls
    // This function fetches the credit data information
    func fetchCreditData() {
        
        let response = creditDataService.get(ForEndpoint: .creditReportDetails, WithDataType: CreditModel.self)
        response
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                
                switch completion {
                case .failure(let err):
                    print("Error is \(err.localizedDescription)")
                    self?.error = err
                case .finished:
                    print("Finished")
                }
            } receiveValue: { [weak self] creditData in
                self?.creditData = creditData
                if let creditScore = creditData.creditReportInfo?.score {
                    self?.creditScore = creditScore
                }
                if let creditMaxScore = creditData.creditReportInfo?.maxScoreValue {
                    self?.creditMaxScore = creditMaxScore
                }
                if let creditReportInfo = creditData.creditReportInfo {
                    self?.creditReportInfo = creditReportInfo
                }
                if let coachingSummary = creditData.coachingSummary {
                    self?.coachingSummary = coachingSummary
                }
                self?.error = nil
                // TODO: - Remove prints
                print("Received data succesfully:\t\(String(describing: self?.creditData))")
            }
            .store(in: &cancellables)
    }
}
