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

    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}
