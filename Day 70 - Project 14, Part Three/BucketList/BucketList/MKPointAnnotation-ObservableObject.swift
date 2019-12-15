//
//  MKPointAnnotation-ObservableObject.swift
//  BucketList
//
//  Created by Sebastian Vidrea on 14/12/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import MapKit

extension MKPointAnnotation: ObservableObject {
    public var wrappedTitle: String {
        get {
            self.title ?? "Unknown value"
        }

        set {
            title = newValue
        }
    }

    public var wrappedSubtitle: String {
        get {
            self.subtitle ?? "Unknown value"
        }

        set {
            subtitle = newValue
        }
    }
}
