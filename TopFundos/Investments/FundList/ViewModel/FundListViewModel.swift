//
//  FundListViewModel.swift
//  TopFundos
//
//  Created by Guilherme de Assis dos Santos on 28/10/21.
//

import Foundation

protocol FundListViewModelDelegate {
    func fundDetail(model: FundModel)
}

class FundListViewModel {
    let service = FundListService()
    var delegate: FundListViewModelDelegate?
    
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
    
    func goToDetails(indexPath: IndexPath) {
        self.delegate?.fundDetail(model: self.fundsList[indexPath.row])
    }
}
