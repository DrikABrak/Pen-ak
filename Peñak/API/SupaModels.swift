//
//  SupaModels.swift
//  Peñak
//
//  Created by Cedric Trespeuch on 23/08/2024.
//

import Foundation

struct Pena: Decodable, Identifiable {
    let id: Int
    let name: String
    let address: String
    let longitude: Double
    let latitude: Double
}
