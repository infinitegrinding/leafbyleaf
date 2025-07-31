//
//  CareIndicatorView.swift
//  LeafbyLeaf
//
//  Created by MattHew Phraxayavong on 7/30/25.
//

import SwiftUI
struct CareIndicator: View {
    let icon: String
    let color: Color
    let needsAction: Bool
    let daysSince: Int?
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: icon)
                .font(.caption)
                .foregroundColor(needsAction ? color : .gray)
            
            if let daysSince = daysSince {
                Text("\(daysSince)d")
                    .font(.caption2)
                    .foregroundColor(needsAction ? color : .secondary)
            }
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(needsAction ? color.opacity(0.1) : Color.clear)
        .cornerRadius(8)
    }
}
