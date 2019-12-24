//
//  WithOptionalAnimation.swift
//  Flashzilla
//
//  Created by Sebastian Vidrea on 24/12/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}
