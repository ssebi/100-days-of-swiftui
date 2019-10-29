//
//  ContentView.swift
//  WeConvert
//
//  Created by Sebastian Vidrea on 12/10/2019.
//  Copyright © 2019 App Company. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    enum MeasurementUnit: Int {
        case temperature, length, duration, volume

        var string: String {
            switch self {
            case .temperature:
                return "Temperature"
            case .length:
                return "Length"
            case .duration:
                return "Time"
            case .volume:
                return "Volume"
            }
        }
    }

    // MARK: - State
    @State private var selectedUnit = 0
    @State private var valueToConvert = ""
    @State private var convertFrom = 0
    @State private var convertTo = 0

    // MARK: - Properties
    private let availableUnits = [MeasurementUnit.temperature, MeasurementUnit.length, MeasurementUnit.duration, MeasurementUnit.volume]

    private var units: [Dimension] {
        switch MeasurementUnit(rawValue: selectedUnit) {
        case .temperature:
            return [UnitTemperature.celsius, UnitTemperature.fahrenheit, UnitTemperature.kelvin]
        case .length:
            return [UnitLength.meters, UnitLength.kilometers, UnitLength.feet, UnitLength.yards, UnitLength.miles]
        case .duration:
            return [UnitDuration.seconds, UnitDuration.minutes, UnitDuration.hours]
        case .volume:
            return [UnitVolume.milliliters, UnitVolume.liters, UnitVolume.cups, UnitVolume.pints, UnitVolume.gallons]
        case .none:
            return []
        }
    }


    // MARK: - Computed Properties
    private var result: Text {
        guard let value = Double(valueToConvert) else { return Text("--") }
        let fromUnit = units[convertFrom]
        let toUnit = units[convertTo]
        let measurement = Measurement(value: value, unit: fromUnit)

        return Text("\(measurement.converted(to: toUnit).value, specifier: "%.2f")")
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Measurement Unit")) {
                    Picker("Measurement Unit", selection: $selectedUnit) {
                        ForEach(0 ..< availableUnits.count) {
                            Text("\(self.availableUnits[$0].string)")
                        }
                    }
                }

                Section(header: Text("Enter value to convert")) {
                    TextField("Value to convert", text: $valueToConvert)
                        .keyboardType(.decimalPad)
                }

                HStack {
                    // MARK: - Input Unit Picker
                    Section(header: Text("From")) {
                        Picker("From", selection: $convertFrom) {
                            ForEach(0 ..< self.units.count) {
                                Text("\(self.units[$0].symbol)")
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(minWidth: 0, maxWidth: .infinity / 2, alignment: .center)
                    }

                    Section(header: Text("To")) {
                        // MARK: - Output Unit Picker
                        Picker("To", selection: $convertTo) {
                            ForEach(0 ..< self.units.count) {
                                Text("\(self.units[$0].symbol)")
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(minWidth: 0, maxWidth: .infinity / 2, alignment: .center)
                    }
                }

                Section(header: Text("Result")) {
                    self.result
                }

            }.navigationBarTitle("WeConvert")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
