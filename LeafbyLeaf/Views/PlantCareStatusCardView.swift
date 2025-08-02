//
//  PlantCareStatusCardView.swift
//  LeafbyLeaf
//
//  Created by MattHew Phraxayavong on 7/30/25.
//

import SwiftUI

struct PlantCareStatusCardView: View {
    let title: String
    let icon: String
    let color: Color
    let lastAction: Date?
    let daysSince: Int?
    let needsAction: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)
            
            Text(title)
                .font(.caption)
                .fontWeight(.medium)
            
            if let lastAction = lastAction {
                Text(lastAction, style: .date)
                    .font(.caption2)
                    .foregroundColor(.secondary)
                
                if let daysSince = daysSince {
                    Text("\(daysSince) days ago")
                        .font(.caption2)
                        .foregroundColor(needsAction ? .red : .green)
                }
            } else {
                Text("Never")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(needsAction ? color : Color.clear, lineWidth: 2)
        )
    }
}

struct CareActionButton: View {
    let title: String
    let icon: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.title2)
                Text(title)
                    .font(.caption)
                    .fontWeight(.medium)
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(color)
            .cornerRadius(12)
        }
    }
}

