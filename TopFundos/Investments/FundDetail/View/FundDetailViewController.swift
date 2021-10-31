//
//  FundDetailViewController.swift
//  TopFundos
//
//  Created by Guilherme de Assis dos Santos on 31/10/21.
//

import UIKit
import Kingfisher

class FundDetailViewController: UIViewController {
    
    @IBOutlet weak var fundNameLabel: UILabel!
    @IBOutlet weak var initialDateLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var viewModel: FundDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func setup() {
        let urlString = self.viewModel?.model.strategy_video?.thumbnail ?? "https://st4.depositphotos.com/14953852/22772/v/600/depositphotos_227724992-stock-illustration-image-available-icon-flat-vector.jpg"
        let url = URL(fileURLWithPath: urlString)
        self.fundNameLabel.text = self.viewModel?.model.full_name
        self.initialDateLabel.text = self.viewModel?.model.initial_date
        self.descriptionLabel.text = self.viewModel?.model.fund_manager.description
        self.imageView.kf.setImage(with: url, placeholder: nil, options: nil) { result in
            self.imageView.contentMode = .scaleAspectFit
        }
    }

}
