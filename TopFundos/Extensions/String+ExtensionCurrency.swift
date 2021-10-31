//
//  String+ExtensionCurrency.swift
//  TopFundos
//
//  Created by Guilherme de Assis dos Santos on 30/10/21.
//

import Foundation

extension String {
    func toCurrencyFormat() -> String {
        if let valueToDouble = (Double(self)) {
            let numberFormatter = NumberFormatter()
            numberFormatter.locale = Locale(identifier: "pt-BR")
            numberFormatter.numberStyle = NumberFormatter.Style.currency
            return numberFormatter.string(from: NSNumber(value: valueToDouble)) ?? ""
        }
        return ""
    }
}
