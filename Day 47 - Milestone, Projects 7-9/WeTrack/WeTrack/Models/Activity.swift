//
//  Activity.swift
//  WeTrack
//
//  Created by Sebastian Vidrea on 21/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct Activity: Identifiable, Codable {
    let id: UUID
    let title: String
    let description: String?
    let count: Int

    init?(id: UUID? = UUID(), title: String, description: String?, count: Int? = 0) {
        guard let id = id,
            let count = count else { return nil }
        self.id = id
        self.title = title
        self.description = description
        self.count = count
    }
}
