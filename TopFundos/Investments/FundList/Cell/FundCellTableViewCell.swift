//
//  FundCellTableViewCell.swift
//  TopFundos
//
//  Created by Guilherme de Assis dos Santos on 27/10/21.
//

import UIKit

class FundCellTableViewCell: UITableViewCell {
    
    let minimumText = "Aplicação mínima:"

    var viewModel: FundCellViewModel?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var minimumLabel: UILabel!
    @IBOutlet weak var strategyLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var strategyView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }

    func setup() {
        guard let vm = self.viewModel else { return }
        self.nameLabel.text = vm.model.simple_name
        self.minimumLabel.text = "\(minimumText) \(String(describing: vm.model.operability.minimum_balance_permanence.toCurrencyFormat()))"
        self.strategyLabel.text = "Estratégia: \(vm.model.specification.fund_main_strategy_name)"
        self.classLabel.text = vm.model.specification.fund_class
        let double = Double(vm.model.profitabilities?.year ?? "0")
        self.percentageLabel.text =  String(format: "%.2f", double ?? 0)
        
        self.leftView.backgroundColor = UIColor(named: vm.model.specification.fund_risk_profile.name)
        self.leftView.layer.cornerRadius = 4
        self.leftView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        self.strategyView.layer.cornerRadius = 4
    }
    
}
