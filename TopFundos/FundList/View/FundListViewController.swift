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
        self.tableView.register(UINib(nibName: "FundCellTableViewCell", bundle: nil), forCellReuseIdentifier: self.identifierCell)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension FundListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: self.identifierCell) as! FundCellTableViewCell
        cell.viewModel = FundCellViewModel(model: .init(simple_name: "Teste"))
        cell.setup()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(202)
    }
}
