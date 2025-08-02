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
    @State private var showingPhotoCapture = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Plant Photo Section
                    VStack(spacing: 12) {
                        if let photo = plant.photo {
                            Image(uiImage: photo)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxHeight: 250)
                                .cornerRadius(12)
                                .onTapGesture {
                                    showingPhotoCapture = true
                                }
                        } else {
                            Button(action: {
                                showingPhotoCapture = true
                            }) {
                                VStack(spacing: 16) {
                                    Image(systemName: "camera.fill")
                                        .font(.system(size: 40))
                                        .foregroundColor(.gray)
                                    Text("Add Photo")
                                        .font(.headline)
                                        .foregroundColor(.gray)
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 200)
                                .background(Color(.systemGray6))
                                .cornerRadius(12)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    // Plant Header
                    VStack(spacing: 12) {
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
                            
                            CareActionButton(
                                title: "Fertilize",
                                icon: "leaf.fill",
                                color: .green,
                                action: {
                                    plant.fertilized()
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
                        
                        InfoRow(label: "Added", value: plant.dateAdded)
                        InfoRow(label: "Days Owned", value: plant.dateAdded, isRelative: true)
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
            .sheet(isPresented: $showingPhotoCapture) {
                PhotoCaptureView { image in
                    plant.addPhoto(image)
                }
            }
        }
    }
}
