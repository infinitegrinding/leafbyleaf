//
//  Plant.swift
//  LeafbyLeaf
//
//  Created by MattHew Phraxayavong on 7/29/25.
//

import Foundation

struct Plant: Identifiable, Codable {
    let id = UUID()
    var name: String
    var species: String
    var dateAdded: Date
    var notes: String
    var lastWatered: Date?
    var lastFertilized: Date?
    
    init(name: String, species: String = "", notes: String = "") {
        self.name = name
        self.species = species
        self.dateAdded = Date()
        self.notes = notes
        self.lastWatered = nil
        self.lastFertilized = nil
    }
}
