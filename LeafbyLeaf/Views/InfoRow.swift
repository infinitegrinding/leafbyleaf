//
//  InfoRow.swift
//  LeafbyLeaf
//
//  Created by MattHew Phraxayavong on 8/1/25.
//

import Foundation
import SwiftUI
struct InfoRow: View {
    let label: String
    let value: Date
    let isRelative: Bool
        
        init(label: String, value: Date, isRelative: Bool = false) {
            self.label = label
            self.value = value
            self.isRelative = isRelative
        }
    
    var body: some View {
        HStack {
            Text(label)
                .font(.caption)
                .foregroundColor(.secondary)
            Spacer()
            if isRelative {
                            Text(value, style: .relative)
                                .font(.caption)
                        } else {
                            Text(value, style: .date)
                                .font(.caption)
                        }
                    }
                }
            }
