//
//  UnderlinedField.swift
//  BMIDiseaseTracker
//
//  Created by Alexander Zhurov on 10.04.22.
//

import SwiftUI

struct UnderlinedField: View {
    private let label: String
    @Binding var text: String
    @State var focused: Bool = false

    init(_ label: String, text: Binding<String>) {
        self.label = label
        _text = text
    }
    
    var body: some View {
        VStack(spacing: 5) {
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(label).foregroundColor(.placeholderGray)
                }
                
                TextField("", text: $text, onEditingChanged: { focused = $0 })
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
            }
            .font(.system(size: 18, weight: .medium))
            .foregroundColor(color)
            
            Rectangle()
                .fill(color)
                .frame(maxWidth: .infinity, minHeight: 1.5, maxHeight: 1.5)
        }
    }
    
    var color: Color {
        if focused || !text.isEmpty {
            return .appBlue
        } else {
            return .lightGray
        }
    }
}
