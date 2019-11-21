//
//  DynamicFiltering.swift
//  CoreDataProject
//
//  Created by Sebastian Vidrea on 20/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

enum Predicates: String {
    case beginsWith = "BEGINSWITH"
}

struct DynamicFiltering: View {
    @Environment(\.managedObjectContext) var moc
    @State var lastNameFilter = "A"
    let sortDescriptors = [NSSortDescriptor(keyPath: \Singer.firstName, ascending: true)]

    var body: some View {
        VStack {
            FilteredList(predicate: .beginsWith, filterKey: "lastName", filterValue: lastNameFilter, sortDescriptors: sortDescriptors) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastname)")
            }

            Button("Add Examples") {
                let taylor = Singer(context: self.moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"

                let ed = Singer(context: self.moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"

                let adele = Singer(context: self.moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"

                let alice = Singer(context: self.moc)
                alice.firstName = "Alice"
                alice.lastName = "Smith"

                let bob = Singer(context: self.moc)
                bob.firstName = "Bob"
                bob.lastName = "Jones"

                let charlie = Singer(context: self.moc)
                charlie.firstName = "Charlie"
                charlie.lastName = "Smith"

                try? self.moc.save()
            }

            Button("Show A") {
                self.lastNameFilter = "A"
            }

            Button("Show S") {
                self.lastNameFilter = "S"
            }
        }
    }
}

struct DynamicFiltering_Previews: PreviewProvider {
    static var previews: some View {
        DynamicFiltering()
    }
}
