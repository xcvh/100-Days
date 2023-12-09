//
//  ContentView.swift
//  ConvertMe
//
//  Created by Jeldo Arno Meppen on 07.12.23.
//

import SwiftUI

struct ContentView: View {
    enum TemperatureUnits: String, CaseIterable {
        case celsius = "°Celcius"
        case fahrenheit = "°Fahrenheit"
        case reaumur = "°Réaumur"
        case rankine = "°Rankine"
        case kelvin = "Kelvin"
    }
    
    @State private var inputValue: Double = 0
    @State private var conversionPair: (inputUnit: TemperatureUnits, outputUnit: TemperatureUnits) = (.kelvin,.rankine)
    var outputValue: Double {
        switch conversionPair {
        case (.fahrenheit,.celsius):
            return (inputValue - 32) / 1.8
        case (.celsius,.fahrenheit):
            return (inputValue * 1.8) + 32
        case (.fahrenheit,.kelvin):
            return (inputValue + 459.67) / 1.8
        case (.celsius,.kelvin):
            return inputValue + 273.16
        case (.reaumur,.kelvin):
            return (inputValue * 1.25) + 273.16
        case (.reaumur,.celsius):
            return inputValue * 1.25
        case (.rankine,.kelvin):
            return inputValue / 1.8
        case (.kelvin,.fahrenheit):
            return (inputValue * 1.8) - 459.67
        case (.kelvin,.celsius):
            return inputValue - 273.16
        case (.kelvin,.reaumur):
            return (inputValue - 273.16) * 0.8
        case (.fahrenheit,.reaumur):
            return (inputValue - 32) / 2.25
        case (.celsius,.reaumur):
            return inputValue * 0.8
        case (.reaumur,.fahrenheit):
            return (inputValue * 2.25) + 32
        case (.rankine,.fahrenheit):
            return inputValue - 459.67
        case (.fahrenheit,.rankine):
            return inputValue + 459.67
        case (.kelvin,.rankine):
            return inputValue * 1.8
        case (.rankine,.celsius):
            return (inputValue - 491.67) / 1.8
        case (.celsius,.rankine):
            return (inputValue * 1.8) + 491.67
        case (.reaumur,.rankine):
            return (inputValue * 2.25) + 491.67
        case (.rankine,.reaumur):
            return (inputValue - 491.67) / 2.25

        default:
            return inputValue
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Convert from") {
                    TextField("Value", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                    Picker("Unit", selection: $conversionPair.inputUnit) {
                        ForEach(TemperatureUnits.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                }
                
                Section("Convert to") {
                    Text(outputValue, format: .number.precision(.significantDigits(0...3)))
                    Picker("Unit", selection: $conversionPair.outputUnit) {
                        ForEach(TemperatureUnits.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                }
            }.navigationTitle("ConvertMe").navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
