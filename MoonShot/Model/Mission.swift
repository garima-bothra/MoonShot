//
//  Mission.swift
//  MoonShot
//
//  Created by Garima Bothra on 30/06/20.
//  Copyright © 2020 Garima Bothra. All rights reserved.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }

    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }

    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }

    var crewMembers: [CrewMember] {

        var matches = [CrewMember]()
        let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")

        for member in crew {
                if let match = astronauts.first(where: { $0.id == member.name }) {
                    matches.append(CrewMember(role: member.role, astronaut: match))
                } else {
                    fatalError("Missing \(member)")
                }
            }
            return matches
        }
    
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
}
