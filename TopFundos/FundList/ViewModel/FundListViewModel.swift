//
//  FundListViewModel.swift
//  TopFundos
//
//  Created by Guilherme de Assis dos Santos on 28/10/21.
//

import Foundation

class FundListViewModel {
    let service = FundListService()
    
    var fundsList: [FundModel] = []
    func fetchInitialData(handler: @escaping () -> Void) {
        service.fetchFunds { result in
            switch result {
            case .success(let funds):
                self.fundsList = funds
                handler()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
