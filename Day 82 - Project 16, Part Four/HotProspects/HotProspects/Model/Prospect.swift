//
//  Prospect.swift
//  HotProspects
//
//  Created by Sebastian Vidrea on 22/12/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    let id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    var isContacted = false
}

class Prospects: ObservableObject {
    @Published var people: [Prospect]

    init() {
        self.people = []
    }
}
