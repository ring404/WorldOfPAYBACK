//
//  FilteredListOfTransactionsView.swift
//  WorldOfPAYBACK
//
//  Created by Dmitrii Priimuk on 28.04.2024.
//

import SwiftUI

struct FilteredListOfTransactionsView: View {
    let transactions: [TransactionItem]
    let selectedCategory: Int
    var sumOfFiltered: Int {
        if selectedCategory == 0 {
            return transactions.reduce(0) { $0 + $1.transactionDetail.value.amount }
        } else {
            return transactions
                .filter { $0.category == selectedCategory }
                .reduce(0) { $0 + $1.transactionDetail.value.amount }
        }
    }
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    var body: some View {
        HStack {
            Text("Sum of filtered transactions is: \(sumOfFiltered)")
                .font(.headline)
                .padding()
        }
        HStack {
            List(transactions) { transaction in
                NavigationLink(destination: DetailView(transaction: transaction)) {
                    VStack {
                        Text("Booking Date: \(dateFormatter.string(from: transaction.transactionDetail.bookingDate) )")
                        Text("Partner: \(transaction.partnerDisplayName)")
                        Text("Description: \(transaction.transactionDetail.description ?? "not found")")
                        Text("Amount: \(transaction.transactionDetail.value.amount) \(transaction.transactionDetail.value.currency)")
                    }
                    .frame(maxWidth: .infinity, alignment: .centerLastTextBaseline)
                }
            }
        }
    }
}
