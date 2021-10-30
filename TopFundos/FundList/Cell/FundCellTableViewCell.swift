//
//  FundCellTableViewCell.swift
//  TopFundos
//
//  Created by Guilherme de Assis dos Santos on 27/10/21.
//

import UIKit

class FundCellTableViewCell: UITableViewCell {

    var viewModel: FundCellViewModel?
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var strategyView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }

    func setup() {
        self.nameLabel.text = viewModel?.model.simple_name
        self.leftView.layer.cornerRadius = 4
        self.leftView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        self.strategyView.layer.cornerRadius = 4
    }
    
}
