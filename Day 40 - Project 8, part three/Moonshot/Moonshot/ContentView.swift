//
//  ContentView.swift
//  Moonshot
//
//  Created by Sebastian Vidrea on 03/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    @State private var isShowingCrew = false

    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(currentMission: mission, astronauts: self.astronauts, missions: self.missions)) {
                    Image(mission.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 44, height: 44)

                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(self.isShowingCrew ? self.crewMemberNames(forMission: mission) : mission.formattedLaunchDate)
                    }
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(trailing:
                Button(isShowingCrew ? "Show launch dates" : "Show Crew") {
                    self.isShowingCrew.toggle()
                }
            )
        }
    }

    func crewMemberNames(forMission mission: Mission) -> String {
        var matches = [String]()
        for astronaut in astronauts {
            if let _ = mission.crew.first(where: { $0.name == astronaut.id }) {
                matches.append(astronaut.name)
            }
        }

        return matches.joined(separator: ", ")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
