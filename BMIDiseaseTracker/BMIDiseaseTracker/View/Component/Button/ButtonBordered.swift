//
//  ButtonBordered.swift
//  BMIDiseaseTracker
//
//  Created by Alexander Zhurov on 10.04.22.
//

import SwiftUI

struct ButtonBordered: View {
    private let label: String
    private let disabled: Bool
    private let colorScheme: ColorScheme
    private let action: () -> Void
    
    enum ColorScheme {
        case blue
        case green
        case gray
        
        func textColor() -> Color {
            switch self {
                case .blue: return .appBlue
                case .green: return .green
                case .gray: return .placeholderGray
            }
        }
        
        func strokeColor() -> Color {
            switch self {
                case .blue: return .appBlue
                case .green: return .green
                case .gray: return .lightGray
            }
        }
    }
    
    init(label: String, disabled: Bool = false, color: ColorScheme = .blue, action: @escaping () -> Void = {}) {
        self.label = label
        self.disabled = disabled
        self.colorScheme = color
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(label)
                .foregroundColor(colorScheme.textColor())
                .font(.system(size: 18, weight: .medium))
                .frame(maxWidth: .infinity)
                .padding(14)
                .contentShape(Rectangle())
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(colorScheme.strokeColor(), lineWidth: 1)
                )
                .overlay(
                    Color.white.opacity(disabled ? 0.4 : 0)
                )
        }
        .disabled(disabled)
    }
}

