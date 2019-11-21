//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Sebastian Vidrea on 20/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var sortDescriptors: [NSSortDescriptor]
    var entities: FetchedResults<T> { fetchRequest.wrappedValue }
    var content: (T) -> Content

    var body: some View {
        List(entities, id: \.self) {
            self.content($0)
        }
    }

    init(predicate: String,
         filterKey: String,
         filterValue: String,
         sortDescriptors: [NSSortDescriptor],
         @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: sortDescriptors, predicate: NSPredicate(format: "%K \(predicate) %@", filterKey, filterValue))
        self.sortDescriptors = sortDescriptors
        self.content = content
    }
}
