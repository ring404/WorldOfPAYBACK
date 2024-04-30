//
//  DetailView.swift
//  WorldOfPAYBACK
//
//  Created by Dmitrii Priimuk on 28.04.2024.
//

import SwiftUI


struct DetailView: View {
    let transaction: TransactionItem
    
    var body: some View {
        VStack {
            Text("Partner: \(transaction.partnerDisplayName)")
            Text("Description: \(transaction.transactionDetail.description ?? "not found")")
        }
        .font(.title)
        .padding()
    }
}
