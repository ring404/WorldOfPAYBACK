//
//  FilteredListOfTransactionsView.swift
//  WorldOfPAYBACK
//
//  Created by Dmitrii Priimuk on 28.04.2024.
//

import SwiftUI

struct FilteredListOfTransactionsView: View {
    var transactions: [TransactionItem]
    private let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            formatter.timeStyle = .short
            return formatter
        }()
    var body: some View {
        List(transactions) { transaction in
            NavigationLink(destination: DetailView(transaction: transaction)) {
                Text("Booking Date: \(dateFormatter.string(from: transaction.transactionDetail.bookingDate) )")
                Text("Partner: \(transaction.partnerDisplayName)")
                Text("Description: \(transaction.transactionDetail.description ?? "not found")")
                Text("Amount: \(transaction.transactionDetail.value.amount) \(transaction.transactionDetail.value.currency)")
            }
        }
    }
}
