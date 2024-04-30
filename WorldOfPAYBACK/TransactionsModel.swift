//
//  TransactionsModel.swift
//  WorldOfPAYBACK
//
//  Created by Dmitrii Priimuk on 26.04.2024.
//

import Foundation

struct Transactions: Decodable {
    let items: [TransactionItem]
}

struct TransactionItem: Decodable, Identifiable {
    var id: String {
        alias.reference
    }
    
    let partnerDisplayName: String
    let alias: Alias
    let category: Int
    let transactionDetail: TransactionDetail
}

struct Alias: Decodable {
    let reference: String
}

struct TransactionDetail: Decodable {
    let description: String?
    let bookingDate: Date
    let value: Value
}

struct Value: Decodable {
    let amount: Int
    let currency: String
}
