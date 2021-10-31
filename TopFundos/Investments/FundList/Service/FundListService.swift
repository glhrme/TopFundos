//
//  FundListService.swift
//  TopFundos
//
//  Created by Guilherme de Assis dos Santos on 29/10/21.
//

import Foundation
import Alamofire

class FundListService {
    let endpoint = "https://s3.amazonaws.com/orama-media/json/fund_detail_full.json"
    
    func fetchFunds(handler: @escaping (_ funds: Result<[FundModel], Error> ) -> Void) {
        AF.request(endpoint, method: .get).responseData { response in
            switch response.result {
            case .success(let data):
                return handler(self.parseFunds(data: data))
            case .failure(let error):
                return handler(.failure(error))
            }
        }
    }
}

extension FundListService {
    private func parseFunds(data: Data) -> Result<[FundModel], Error> {
        let decoder = JSONDecoder()
        do {
            let funds = try decoder.decode([FundModel].self, from: data)
            return .success(funds)
        } catch {
            return .failure(error)
        }
    }
}
