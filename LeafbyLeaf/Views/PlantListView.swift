//
//  PlantListView.swift
//  LeafbyLeaf
//
//  Created by MattHew Phraxayavong on 7/29/25.
//

import SwiftUI

struct PlantListView: View {
    @State private var plants: [Plant] = []
    @State private var showingAddPlant = false
    @State private var selectedPlant: Plant?
    
    var body: some View {
        NavigationView {
            List {
                if plants.isEmpty {
                    VStack(spacing: 20) {
                        Image(systemName: "leaf.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.green)
                        Text("No plants yet!")
                            .font(.title2)
                            .foregroundColor(.secondary)
                        Text("Tap the + button to add your first plant")
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 40)
                    .listRowBackground(Color.clear)
                } else {
                    ForEach(plants) { plant in
                        PlantRowView(plant: plant)
                            .onTapGesture {
                                selectedPlant = plant
                            }
                    }
                    .onDelete(perform: deletePlants)
                }
            }
            .navigationTitle("My Plants")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddPlant = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddPlant) {
                AddPlantView { newPlant in
                    plants.append(newPlant)
                }
            }
            .sheet(item: $selectedPlant) { plant in
                if let index = plants.firstIndex(where: { $0.id == plant.id }) {
                    PlantDetailView(plant: $plants[index])
                }
            }
        }
    }
    
    private func deletePlants(offsets: IndexSet) {
        plants.remove(atOffsets: offsets)
    }
}


#Preview {
    PlantListView()
}
