//
//  TransactionsViewModel.swift
//  WorldOfPAYBACK
//
//  Created by Dmitrii Priimuk on 28.04.2024.
//

import SwiftUI
import Combine

class TransactionsViewModel: ObservableObject {
    @Published var transactions: [TransactionItem] = []
    @Published var errorMessage: String?
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let url = Bundle.main.url(forResource: "Transactions", withExtension: "json") else {
            print("Data file not found.")
            self.errorMessage = "Failed to fetch transactions.Probably your device is offline."
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let result = try decoder.decode(Transactions.self, from: data)
            transactions = result.items.sorted(by: { $0.transactionDetail.bookingDate < $1.transactionDetail.bookingDate })
        } catch {
            print("Error decoding JSON: \(error)")
           
        }
    }
}
