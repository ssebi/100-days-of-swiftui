//
//  DetailsView.swift
//  WeTrack
//
//  Created by Sebastian Vidrea on 21/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct DetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var activities: Activities
    private let activity: Activity

    private var showsDescription: Bool {
        activity.description != nil
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            VStack(alignment: .leading) {
                Text("Title")
                    .font(.subheadline)
                Text(activity.title)
                    .font(.title)
            }

            if showsDescription {
                VStack(alignment: .leading) {
                    Text("Description")
                        .font(.subheadline)
                    Text(activity.description ?? "")
                        .font(.title)
                }
            }

            HStack {
                Text("Times completed:")
                    .font(.title)
                Spacer()
                HStack(spacing: 16) {
                    Text("\(activity.count)")
                        .font(.title)
                    Button("+ 1") {
                        let indexOfActivity = self.activities.activities.firstIndex { $0.id == self.activity.id }
                        if let indexOfActivity = indexOfActivity {
                            let newActivity = Activity(id: self.activity.id,
                                                       title: self.activity.title,
                                                       description: self.activity.description,
                                                       count: self.activity.count + 1)!
                            self.activities.activities[indexOfActivity] = newActivity

                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
            }

            .font(.title)
            .frame(maxWidth: .infinity)

            Spacer()
        }
        .padding()
        .navigationBarTitle("Activity Details")

    }

    init(currentActivity: Activity, activities: Activities) {
        self.activities = activities
        activity = currentActivity
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(currentActivity: Activity(id: UUID(), title: "Sample", description: "Activity", count: 3)!,
                    activities: Activities())
    }
}
