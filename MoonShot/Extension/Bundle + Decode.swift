//
//  Bundle + Decode.swift
//  MoonShot
//
//  Created by Garima Bothra on 30/06/20.
//  Copyright © 2020 Garima Bothra. All rights reserved.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()
        let e1 = DateFormatter()
        e1.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(e1)

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}
