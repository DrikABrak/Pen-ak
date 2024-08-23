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
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
