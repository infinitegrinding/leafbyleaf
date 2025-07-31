//
//  PlantDetailView.swift
//  LeafbyLeaf
//
//  Created by MattHew Phraxayavong on 7/30/25.
//

import SwiftUI

struct PlantDetailView: View {
    @Binding var plant: Plant
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Plant Header
                    VStack(spacing: 12) {
                        Image(systemName: "leaf.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.green)
                        
                        Text(plant.name)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(plant.species)
                            .font(.title3)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    
                    // Care Status Cards
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 16) {
                        PlantCareStatusCardView(
                            title: "Watering",
                            icon: "drop.fill",
                            color: .blue,
                            lastAction: plant.lastWatered,
                            daysSince: plant.daysSinceWatered,
                            needsAction: plant.needsWater
                        )
                        
                        PlantCareStatusCardView(
                            title: "Fertilizing",
                            icon: "leaf.fill",
                            color: .green,
                            lastAction: plant.lastFertilized,
                            daysSince: plant.daysSinceFertilized,
                            needsAction: plant.needsFertilizer
                        )
                    }
                    .padding(.horizontal)
                    
                    // Care Actions
                    VStack(spacing: 12) {
                        Text("Care Actions")
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack(spacing: 12) {
                            CareActionButton(
                                title: "Water Plant",
                                icon: "drop.fill",
                                color: .blue,
                                action: {
                                    plant.water()
                                }
                            )
                        }
                    }
                    .padding(.horizontal)
                    
                    // Notes Section
                    if !plant.notes.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Notes")
                                .font(.headline)
                            
                            Text(plant.notes)
                                .font(.body)
                                .foregroundColor(.secondary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    }
                    
                    // Plant Info
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Plant Info")
                            .font(.headline)
                        
                        Text("Added: \(plant.dateAdded, style: .date)")
                                                .font(.caption2)
                                                .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                }
                .padding(.vertical)
            }
            .navigationTitle("Plant Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}
