//
//  AddView.swift
//  Expense Item
//
//  Created by David OH on 12/03/2023.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "personal"
    @State private var amt: Double = 0
    let types = ["personal","business","balling "]
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Name", text: $name)
                
                Picker("type", selection: $type){
                    ForEach(types, id: \.self){ type in
                        Text(type)
                    }
                }
                
                TextField("Amount" , value: $amt,format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            
            .navigationTitle("Add New Expenses")
            .toolbar{
                Button("Save"){
                    let item = ExpenseItem(name: name, type: type, amount: amt)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
