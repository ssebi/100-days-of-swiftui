//
//  Candy+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Sebastian Vidrea on 20/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?

    public var wrappedName: String {
        name ?? "Unknown Name"
    }
}
