//
//  LinkButtonFilled.swift
//  BMIDiseaseTracker
//
//  Created by Alexander Zhurov on 10.04.22.
//

import SwiftUI

struct LinkButtonFilled<DestinationView: View>: View {
    private let label: String
    private let destination: DestinationView
    private let colorScheme: ColorScheme
    
    enum ColorScheme {
        case blue
        case green
        case gray
        
        func textColor() -> Color {
            switch self {
                case .blue: return .white
                case .green: return .white
                case .gray: return .white
            }
        }
        
        func backgroundColor() -> Color {
            switch self {
                case .blue: return .appBlue
                case .green: return .green
                case .gray: return .gray
            }
        }
    }
    
    init(label: String, destination: DestinationView, color: ColorScheme = .blue) {
        self.label = label
        self.destination = destination
        self.colorScheme = color
    }
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(label)
                .foregroundColor(colorScheme.textColor())
                .font(.system(size: 18, weight: .medium))
                .frame(maxWidth: .infinity)
                .padding(14)
                .contentShape(Rectangle())
                .background(colorScheme.backgroundColor())
                .cornerRadius(12)
        }
    }
}
