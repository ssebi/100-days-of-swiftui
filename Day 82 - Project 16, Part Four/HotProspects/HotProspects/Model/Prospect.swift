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
    var createdAt = Date()
    fileprivate(set) var isContacted = false
}

class Prospects: ObservableObject {
    static let saveKey = "SavedData"

    @Published private(set) var people: [Prospect]

    init() {
        if let data = Self.readData(fromFile: Self.saveKey) {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                self.people = decoded
                return
            }
        }

        self.people = []
    }

    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }

    private func save() {
        if let encoded = try? JSONEncoder().encode(people) {
            write(encoded, toFile: Self.saveKey)
        }
    }

    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }

    private func write(_ data: Data, toFile file: String) {
        let url = Self.getDocumentsDirectory().appendingPathComponent(file)

        do {
            try data.write(to: url, options: .atomic)
        } catch {
            print(error)
        }
    }

    private static func readData(fromFile file: String) -> Data? {
        let url = Self.getDocumentsDirectory().appendingPathComponent(file)

        var data: Data?
        do {
            try data = Data(contentsOf: url)
        } catch {
            print(error)
        }

        return data
    }

    private static func getDocumentsDirectory() -> URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

        // just send back the first one, which ought to be the only one
        return paths[0]
    }
}
