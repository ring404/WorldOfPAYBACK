//
//  TransactionsModel.swift
//  WorldOfPAYBACK
//
//  Created by Dmitrii Priimuk on 26.04.2024.
//

import Foundation

struct Transactions: Codable {
    let items: [TransactionItem]
}

struct TransactionItem: Codable, Identifiable {
    var id: String {
        alias.reference
    }
    
    let partnerDisplayName: String
    let alias: Alias
    let category: Int
    let transactionDetail: TransactionDetail
}

struct Alias: Codable {
    let reference: String
}

struct TransactionDetail: Codable {
    let description: String?
    let bookingDate: Date
    let value: Value
}

struct Value: Codable {
    let amount: Int
    let currency: String
}
