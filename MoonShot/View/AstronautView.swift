//
//  AstronautView.swift
//  MoonShot
//
//  Created by Garima Bothra on 30/06/20.
//  Copyright © 2020 Garima Bothra. All rights reserved.
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
                    HStack {
                        ForEach(self.missions, id: \.id) { mission in
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .frame(width: 83, height: 60)
                                    .clipShape(Capsule())
                                    .overlay(Capsule().stroke(Color.primary, lineWidth: 1))
                                
                                Text(mission.displayName)
                                    .font(.headline)
                                
                            }
                            .padding(.horizontal)
                        }
                    }
                    Text(self.astronaut.description)
                        .layoutPriority(1)
                        .padding()
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
    
    init(astronaut: Astronaut) {
        self.astronaut = astronaut
        let missions: [Mission] = Bundle.main.decode("missions.json")
        var matches = [Mission]()
        
        for mission in missions {
            if let match = mission.crew.first(where: { $0.name == astronaut.id }) {
                matches.append(mission)
                print("\(mission.displayName)")
            } else {
                //  fatalError("Missing \(mission)")
            }
        }
        
        self.missions = matches
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
