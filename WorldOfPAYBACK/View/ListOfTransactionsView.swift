//
//  ContentView.swift
//  WorldOfPAYBACK
//
//  Created by Dmitrii Priimuk on 26.04.2024.
//

import SwiftUI

struct ListOfTransactionsView: View {
    @ObservedObject var viewModel = TransactionsViewModel()
    @State private var selectedCategory: Int = 0
    var filteredTransactions: [TransactionItem] {
        if selectedCategory == 0 {
            return viewModel.transactions
        } else {
            return viewModel.transactions.filter { $0.category == selectedCategory }
        }
    }
    
    var body: some View {
        NavigationView {
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .bold()
            } else {
                VStack {
                    Picker("Filter by Category", selection: $selectedCategory) {
                        Text("All").tag(0)
                        ForEach(viewModel.transactions.map { $0.category }.removeDuplicates().addZeroToBeginning(), id: \.self) { category in
                            if category > 0 {
                                Text("Category \(category)").tag(category)
                            }
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    FilteredListOfTransactionsView(transactions: filteredTransactions, selectedCategory: selectedCategory)
                        .navigationBarTitle("Transactions")
                }
            }
        }
    }
}

extension Array where Element: Hashable {
    func removeDuplicates() -> [Element] {
        var seen = Set<Element>()
        let filtered = filter { seen.insert($0).inserted }
        return filtered
    }
}

extension Array where Element: Numeric {
    func addZeroToBeginning() -> [Element] {
        var newArray = self
        newArray.insert(0, at: 0)
        return newArray
    }
}
