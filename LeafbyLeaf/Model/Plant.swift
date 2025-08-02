//
//  Plant.swift
//  LeafbyLeaf
//
//  Created by MattHew Phraxayavong on 7/29/25.
//

import Foundation
import SwiftUI

struct Plant: Identifiable, Codable {
    let id = UUID()
    var name: String
    var species: String
    var dateAdded: Date
    var notes: String
    var lastWatered: Date?
    var lastFertilized: Date?
    var photoData: Data?
    
    init(name: String, species: String = "", notes: String = "") {
        self.name = name
        self.species = species
        self.dateAdded = Date()
        self.notes = notes
        self.lastWatered = nil
        self.lastFertilized = nil
        self.photoData = nil
        
    }
    
    mutating func water() {
        lastWatered = Date()
    }
    
    mutating func fertilized() {
        lastFertilized = Date()
    }
    
    mutating func addPhoto(_ image: UIImage) {
        photoData = image.jpegData(compressionQuality: 0.8)
    }
    
    var photo: UIImage? {
        guard let photoData = photoData else { return nil }
        return UIImage(data: photoData)
    }
    
    var daysSinceWatered: Int? {
        guard let lastWatered = lastWatered else { return nil }
        return Calendar.current.dateComponents([.day], from: lastWatered, to: Date()).day
    }
    
    var daysSinceFertilized: Int? {
        guard let lastFertilized = lastFertilized else { return nil }
        return Calendar.current.dateComponents([.day], from: lastFertilized, to: Date()).day
    }
    
    var needsWater: Bool {
        guard let daysSinceWatered = daysSinceWatered else { return true }
        return daysSinceWatered >= 3 // Assume plants need water every 3 days
    }
    
    var needsFertilizer: Bool {
        guard let daysSinceFertilized = daysSinceFertilized else { return true }
        return daysSinceFertilized >= 14 // Assume plants need fertilizer every 14 days
    }
}
