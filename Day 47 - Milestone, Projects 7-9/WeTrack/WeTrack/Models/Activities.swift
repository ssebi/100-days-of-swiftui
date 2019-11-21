//
//  Activities.swift
//  WeTrack
//
//  Created by Sebastian Vidrea on 21/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import Foundation
import SwiftUI

class Activities: ObservableObject {
    @Published var activities = [Activity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "activities")
            }
        }
    }

    @Published var count: Int = 0

    init() {
        if let activities = UserDefaults.standard.data(forKey: "activities") {
            if let decoded = try? JSONDecoder().decode([Activity].self, from: activities) {
                self.activities = decoded
                return
            }
        }

        self.activities = []
    }
    
    init(activities: [Activity]) {
        self.activities = activities
    }
}
