//
//  Singer+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Sebastian Vidrea on 20/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?

    var wrappedFirstName: String {
        firstName ?? "Unknown"
    }

    var wrappedLastname: String {
        lastName ?? "Unknown"
    }
}
