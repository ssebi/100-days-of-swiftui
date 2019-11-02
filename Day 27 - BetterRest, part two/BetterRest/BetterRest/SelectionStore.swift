//
//  SelectionStore.swift
//  BetterRest
//
//  Created by Sebastian Vidrea on 02/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import Foundation
import Combine

class SelectionStore: ObservableObject {
    var coffeeAmount: Double = 0.0 {
        didSet {
            calculateBedtime()
        }
    }

    var wakeUp = defaultWakeTime {
        didSet {
            calculateBedtime()
        }
    }

    var sleepAmount = 8.0 {
        didSet {
            calculateBedtime()
        }
    }

    @Published var desiredSleepTime = "--:--"

    private static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }

    private func calculateBedtime() {
        let model = SleepCalculator()

        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60

        do {
            let prediction = try model.prediction(wake: Double(hour + minute),
                                                  estimatedSleep: sleepAmount,
                                                  coffee: coffeeAmount + 1)

            let sleepTime = wakeUp - prediction.actualSleep
            let formatter = DateFormatter()
            formatter.timeStyle = .short

            desiredSleepTime = formatter.string(from: sleepTime)
        } catch {
            print(error.localizedDescription)
        }
    }
}
