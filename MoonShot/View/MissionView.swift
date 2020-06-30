//
//  MissionView.swift
//  MoonShot
//
//  Created by Garima Bothra on 30/06/20.
//  Copyright © 2020 Garima Bothra. All rights reserved.
//

import SwiftUI

struct MissionView: View {

    let mission: Mission
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.7)
                        .padding(.top)
                    Text(self.mission.formattedLaunchDate)
                        .bold()
                    Text(self.mission.description)
                        .padding()
                    HStack {
                        ForEach(self.mission.crewMembers, id: \.role) { crewMember in
                            NavigationLink(destination: AstronautView(astronaut: crewMember.astronaut)) {
                                VStack {
                                    Image(crewMember.astronaut.id)
                                        .resizable()
                                        .frame(width: 83, height: 60)
                                        .clipShape(Capsule())
                                        .overlay(Capsule().stroke(Color.primary, lineWidth: 1))
                                    
                                    VStack(alignment: .leading) {
                                        Text(crewMember.astronaut.name)
                                            .font(.headline)
                                        Text(crewMember.role)
                                            .foregroundColor(.secondary)
                                    }

                                    Spacer()
                                }
                                .padding(.horizontal)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
        }
        .navigationBarTitle(Text(mission.displayName), displayMode: .inline)
    }
    
    init(mission: Mission) {
        self.mission = mission
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[0])
    }
}
