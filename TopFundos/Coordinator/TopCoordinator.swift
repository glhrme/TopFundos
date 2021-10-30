//
//  TopCoordinator.swift
//  TopFundos
//
//  Created by Guilherme de Assis dos Santos on 27/10/21.
//

import UIKit

class TopCoordinator {
    
    var navigation: UINavigationController?
    
    var listView: FundListViewController?
    var listViewModel: FundListViewModel?
    
    func start() -> UINavigationController {
        let navigation = UINavigationController(rootViewController: getListView())
        self.navigation = navigation
        return navigation
    }
    
    func getListView() -> FundListViewController {
        let listView = FundListViewController()
        let viewModel = FundListViewModel()
        listView.viewModel = viewModel
        self.listView = listView
        self.listViewModel = viewModel
        return listView
    }
}

extension TopCoordinator {
    
}
