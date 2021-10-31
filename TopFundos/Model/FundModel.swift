//
//  FundModel.swift
//  TopFundos
//
//  Created by Guilherme de Assis dos Santos on 28/10/21.
//

import UIKit

struct FundModel: Codable {
    let simple_name: String
    let operability: Operability
    let specification: Specification
    
    struct Operability: Codable {
        let minimum_balance_permanence: String
    }
    
    struct Specification: Codable {
        let fund_main_strategy_name: String
        let fund_risk_profile: RiskProfile
        
        struct RiskProfile: Codable {
            let score_range_order: Int
            let name: String
        }
    }
}
