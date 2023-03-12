//
//  ContentView.swift
//  Expense Item
//
//  Created by David OH on 12/03/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showAddView = false
    
    func removeItems(offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView{
            List{
                ForEach(expenses.items,id: \.id){ item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                                .bold()
                                .padding(.bottom,5)
                            Text(item.type)
                        }

                        Spacer()

                        Text(item.amount, format: .currency(code: "USD"))
                    }
                    .padding(.bottom,5)
                    
                }
                .onDelete (perform: removeItems)
            }
            .navigationTitle("IExpense")
            .toolbar{
                Button {
                    showAddView = true
                }label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showAddView) {
            AddView(expenses: expenses)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
