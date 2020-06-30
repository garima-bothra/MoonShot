//
//  ContentView.swift
//  MoonShot
//
//  Created by Garima Bothra on 29/06/20.
//  Copyright © 2020 Garima Bothra. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var launchDate = true
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Spacer(minLength: 2.0)
                        if self.launchDate {
                        Text(mission.formattedLaunchDate)
                        } else {
                            ForEach(0..<mission.crewMembers.count) {
                                Text(mission.crewMembers[$0].astronaut.name)
                            }
                        }
                        Spacer(minLength: 2.0)
                    }
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(trailing:
                Button("Change", action: {
                    self.launchDate.toggle()
                })
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
