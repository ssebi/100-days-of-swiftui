//
//  MainView.swift
//  BucketList
//
//  Created by Sebastian Vidrea on 05/01/2020.
//  Copyright © 2020 AppCompany. All rights reserved.
//

import SwiftUI
import MapKit

struct MainView: View {
    @Binding var selectedPlace: MKPointAnnotation?
    @Binding var locations: [CodableMKPointAnnotation]
    @Binding var showingPlaceDetails: Bool
    @Binding var showingEditScreen: Bool

    @State private var centerCoordinate = CLLocationCoordinate2D()

    var body: some View {
        Group {
            MapView(centerCoordinate: $centerCoordinate,
                    selectedPlace: $selectedPlace,
                    showingPlaceDetails: $showingPlaceDetails,
                    annotations: locations)
                .edgesIgnoringSafeArea(.all)

            Circle()
                .fill(Color.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)

            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        let newLocation = CodableMKPointAnnotation()
                        newLocation.title = "Example Location"
                        newLocation.coordinate = self.centerCoordinate
                        self.locations.append(newLocation)

                        self.selectedPlace = newLocation
                        self.showingEditScreen = true
                    }) {
                        Image(systemName: "plus")
                            .padding()
                            .background(Color.black.opacity(0.75))
                            .foregroundColor(.white)
                            .font(.title)
                            .clipShape(Circle())
                            .padding(.trailing)
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(selectedPlace: .constant(nil),
                 locations: .constant([CodableMKPointAnnotation]()),
                 showingPlaceDetails: .constant(false),
                 showingEditScreen: .constant(false))
    }
}
