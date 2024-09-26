//
//  Item.swift
//  Peñak
//
//  Created by Cedric Trespeuch on 23/08/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var id: Int
    var name: String
    var address: String
    var longitude: Double
    var latitude: Double
    
    init(id: Int, name: String, address: String, longitude: Double, latitude: Double) {
        self.id = id
        self.name = name
        self.address = address
        self.longitude = longitude
        self.latitude = latitude
    }
}
