//
//  Formatter.swift
//  sawn-timber
//
//  Created by Ary Sugiarto on 29/08/25.
//

import Foundation

struct CurrencyFormatter {
    static func format(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "Rp"
        formatter.maximumFractionDigits = 0
        formatter.locale = Locale(identifier: "id_ID") // format Indonesia
        return formatter.string(from: NSNumber(value: value)) ?? "Rp0"
    }
}
