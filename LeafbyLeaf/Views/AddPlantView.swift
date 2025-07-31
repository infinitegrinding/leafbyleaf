//
//  AddPlantView.swift
//  LeafbyLeaf
//
//  Created by MattHew Phraxayavong on 7/29/25.
//

import Foundation

import SwiftUI
// MARK: Adding/Saving new plant to journal

struct AddPlantView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var plantName = ""
    @State private var plantSpecies = ""
    @State private var plantNotes = ""
    
    let onSave: (Plant) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                Section("Plant Information") {
                    TextField("Plant Name", text: $plantName)
                    TextField("Species (Optional", text: $plantSpecies)
                }
                
                Section("Notes (Optional)") {
                    TextField("Add notes about your plant...", text: $plantNotes, axis: .vertical)
                        .lineLimit(3...6)
                }
            }
            .navigationTitle("Add Plant")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        savePlant()
                    }
                    .disabled(plantName.isEmpty)
                }
            }
        }
    }
    
    private func savePlant() {
        let newPlant = Plant(
            name: plantName.trimmingCharacters(in: .whitespacesAndNewlines),
            species: plantSpecies.trimmingCharacters(in: .whitespacesAndNewlines),
            notes: plantNotes.trimmingCharacters(in: .whitespacesAndNewlines)
        )
        onSave(newPlant)
        dismiss()
    }
}

#Preview {
    AddPlantView { _ in }
}
