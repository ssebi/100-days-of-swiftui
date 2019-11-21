//
//  ContentView.swift
//  WeTrack
//
//  Created by Sebastian Vidrea on 19/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var activities = Activities()
    @State private var showingAddActivity = false

    var body: some View {
        NavigationView {
            List {
                ForEach(activities.activities) { (activity: Activity) in
                    NavigationLink(destination: DetailsView(currentActivity: activity, activities: self.activities)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(activity.title)
                                    .font(.title)
                                Text(activity.description ?? "No description")
                                    .font(.subheadline)
                            }

                            Spacer()

                            Text("\(activity.count)")
                                .font(.title)
                                .foregroundColor(activity.count == 0 ? .red : .primary)
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("WeTrack")
            .navigationBarItems(leading: EditButton(), trailing:
                Button(action: {
                    self.showingAddActivity = true
                }) {
                    Image(systemName: "plus")
            })
                .sheet(isPresented: $showingAddActivity) {
                    AddActivity(activities: self.activities)
            }
        }
    }

    private func removeItems(_ offsets: IndexSet) {
        activities.activities.remove(atOffsets: offsets)
    }

    init() { }

    init(activities: Activities) {
        self.activities = activities
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let activities = Activities(activities: [Activity(title: "Binge Watching", description: "Whatch movie series")!,
                                                 Activity(title: "Hiking", description: "Go Hiking", count: 1)!,
                                                 Activity(title: "Cooking", description: "Cook something", count: 3)!])

        return ContentView(activities: activities)
    }
}
