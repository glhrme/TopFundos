//
//  FoundListViewController.swift
//  TopFundos
//
//  Created by Guilherme de Assis dos Santos on 27/10/21.
//

import UIKit

class FundListViewController: UIViewController {
    var viewModel: FundListViewModel?
    let identifierCell = "FundCellTableViewCell"
    
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel?.fetchInitialData(handler: {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
        self.tableView.register(UINib(nibName: "FundCellTableViewCell", bundle: nil), forCellReuseIdentifier: self.identifierCell)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.navigationController?.navigationBar.isHidden = true
    }

}

extension FundListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.fundsList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = self.viewModel else { return UITableViewCell() }
        let cell = self.tableView.dequeueReusableCell(withIdentifier: self.identifierCell) as! FundCellTableViewCell
        cell.viewModel = FundCellViewModel(model: viewModel.fundsList[indexPath.row])
        cell.setup()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(202)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel?.goToDetails(indexPath: indexPath)
    }
}
