//
//  AstronautView.swift
//  Moonshot
//
//  Created by Sebastian Vidrea on 03/11/2019.
//  Copyright © 2019 AppCompany. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let missions: [Mission]

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)

                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)

                    Text("All Missions")
                        .padding()

                    ForEach(self.missions, id: \.id) {
                        Text($0.displayName)
                    }

                    Spacer(minLength: 20)
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }

    init(astronaut: Astronaut, missions: [Mission]) {
        self.astronaut = astronaut

        var matches = [Mission]()

        for mission in missions {
            if let _ = mission.crew.first(where: { $0.name == astronaut.id }) {
                matches.append(mission)
            }
        }

        self.missions = matches
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")

    static var previews: some View {
        AstronautView(astronaut: astronauts[0], missions: missions)
    }
}
