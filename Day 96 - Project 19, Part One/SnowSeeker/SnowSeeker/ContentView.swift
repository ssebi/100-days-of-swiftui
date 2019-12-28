//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Sebastian Vidrea on 28/12/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna, Arya, and Toby")
        }
    }
}

struct PrimaryView: View {
    @State private var selectedUser: User? = nil
    @Environment(\.horizontalSizeClass) var sizeClass

    var body: some View {
        VStack(spacing: 40) {
            Text("Hello, World!")
                .onTapGesture {
                    self.selectedUser = User()
            }
            .alert(item: $selectedUser) { user in
                Alert(title: Text(user.id))
            }
            .navigationBarTitle("Primary")

            NavigationLink(destination: Text("New secondary")) {
                Text("Go to secondary view")
            }

            Group {
                if sizeClass == .compact {
                    VStack(content: UserView.init)
                } else {
                    HStack(content: UserView.init)
                }
            }
        }
    }
}

struct ContentView: View {

    var body: some View {
        NavigationView {
            PrimaryView()

            Text("Secondary")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
