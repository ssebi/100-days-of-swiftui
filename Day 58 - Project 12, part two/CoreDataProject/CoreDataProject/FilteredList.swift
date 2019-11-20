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
    var entities: FetchedResults<T> { fetchRequest.wrappedValue }
    var content: (T) -> Content

    var body: some View {
        List(entities, id: \.self) {
            self.content($0)
        }
    }

    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
}
