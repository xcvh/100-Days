//
//  ContentView.swift
//  WeSplit
//
//  Created by Jeldo Arno Meppen on 05.12.23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 10
    let tipPercentages = [5,10,15,20,0]
    
    @FocusState private var amountIsFocused: Bool
    
    var totalWithTip: Double {
        let tipSelection = Double(tipPercentage) / 100
        let tipValue = checkAmount * tipSelection
        let total =  (checkAmount + tipValue)
        return total
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        return totalWithTip / peopleCount
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("How much and how many") {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) { Text("\($0) people")}
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("How much of a tip do you want to leave?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("Total with tip") {
                    Text(totalWithTip, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundStyle(tipPercentage == 0 ? .red : .primary)
                }
                
                Section("Total per person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit").navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
