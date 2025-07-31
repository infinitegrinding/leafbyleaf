//
//  PlantRowView.swift
//  LeafbyLeaf
//
//  Created by MattHew Phraxayavong on 7/30/25.
//

import SwiftUI
struct PlantRowView: View {
    let plant: Plant
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "leaf.fill")
                    .foregroundColor(.green)
                Text(plant.name)
                    .font(.headline)
                Spacer()
                Text(plant.species)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            if !plant.notes.isEmpty {
                Text(plant.notes)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            
            // Care Status Indicators
            HStack(spacing: 12) {
                CareIndicator(
                    icon: "drop.fill",
                    color: .blue,
                    needsAction: plant.needsWater,
                    daysSince: plant.daysSinceWatered
                )
                
                CareIndicator(
                    icon: "leaf.fill",
                    color: .green,
                    needsAction: plant.needsFertilizer,
                    daysSince: plant.daysSinceFertilized
                )
                
                Spacer()
                
                Text("Added: \(plant.dateAdded, style: .date)")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}
