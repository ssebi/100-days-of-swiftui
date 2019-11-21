//
//  AddActivity.swift
//  WeTrack
//
//  Created by Sebastian Vidrea on 21/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct AddActivity: View {
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject private var activities: Activities

    @State private var title: String = ""
    @State private var description: String = ""

    private var optionalDescription: String? {
        description.trimmingCharacters(in: .whitespaces) == "" ? nil : description
    }

    private var isDisabled: Bool {
        return title.trimmingCharacters(in: .whitespaces).count < 1
    }

    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)

                TextField("Description", text: $description)

                Section {
                    Button(action: {
                        if let activity = Activity(id: UUID(),
                                                   title: self.title,
                                                   description: self.optionalDescription) {

                            self.activities.activities.append(activity)
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }) {
                        Text("Add")
                    }
                    .frame(maxWidth: .infinity)
                    .font(.title)
                    .disabled(isDisabled)
                }
            }
            .navigationBarTitle("Add Activity")
        }
    }

    init(activities: Activities) {
        self.activities = activities
    }
}

struct AddActivity_Previews: PreviewProvider {
    static var previews: some View {
        AddActivity(activities: Activities())
    }
}
