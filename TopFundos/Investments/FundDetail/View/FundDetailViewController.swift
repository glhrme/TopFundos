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
        let url = URL(fileURLWithPath: self.viewModel?.model.strategy_video?.thumbnail ?? "")
        self.fundNameLabel.text = self.viewModel?.model.full_name
        self.initialDateLabel.text = self.viewModel?.model.initial_date
        self.descriptionLabel.text = self.viewModel?.model.fund_manager.description
        self.imageView.kf.setImage(with: url, placeholder: nil, options: nil) { (result) in
            switch result {
            case .success:
                self.imageView.contentMode = .scaleAspectFit
            case .failure:
                self.imageView.image = UIImage(named: "noimage")
            }
        }
    }

}
