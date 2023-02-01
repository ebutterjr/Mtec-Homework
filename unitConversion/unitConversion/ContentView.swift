//
//  ContentView.swift
//  unitConversion
//
//  Created by Easton Butterfield on 1/17/23.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = 0
    @State private var outputUnit = 1
    
    @State private var inputValue = ""
    
    let units = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var body: some View {
        Form {
            Section(header: Text("Input Value")) {
                TextField("Enter a value", text: $inputValue)
                    .keyboardType(.decimalPad)
            }
            
            Section(header: Text("Input Unit")) {
                Picker("Select an input unit", selection: $inputUnit) {
                    ForEach(0 ..< 3) {
                        Text(self.units[$0])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Output Unit")) {
                Picker("Select an output unit", selection: $outputUnit) {
                    ForEach(0 ..< 3) {
                        Text(self.units[$0])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Output")) {
                Text("\(convertedValue(), specifier: "%.2f") \(units[outputUnit])")
            }
        }
    }
    
    func convertedValue() -> Double {
        let input = Double(inputValue) ?? 0
        switch (inputUnit, outputUnit) {
        case (0, 1):
            return input * 9/5 + 32
        case (0, 2):
            return input + 273.15
        case (1, 0):
            return (input - 32) * 5/9
        case (1, 2):
            return (input - 32) * 5/9 + 273.15
        case (2, 0):
            return input - 273.15
        case (2, 1):
            return (input - 273.15) * 9/5 + 32
        default:
            return input
        }
    }
}
