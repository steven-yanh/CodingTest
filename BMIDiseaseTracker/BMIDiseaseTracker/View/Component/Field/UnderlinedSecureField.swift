//
//  UnderlinedSecureField.swift
//  BMIDiseaseTracker
//
//  Created by Alexander Zhurov on 10.04.22.
//

import SwiftUI

struct UnderlinedSecureField: View {
    private let label: String
    @Binding var textBinded: String
    @State var focused: Bool = false
    @State var textState: String
    @State var showPassword: Bool = false

    init(_ label: String, text: Binding<String>) {
        self.label = label
        _textBinded = text
        _textState = State(initialValue: text.wrappedValue)
    }
    
    var body: some View {
        VStack(spacing: 5) {
            ZStack(alignment: .leading) {
                if textState.isEmpty {
                    Text(label)
                        .foregroundColor(.placeholderGray)
                        .font(.system(size: 18, weight: .medium, design: .default))
                }

                TextField("", text: $textState, onEditingChanged: { focused = $0 })
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .overlay(
                        HStack {
                            Spacer()
                            Image("eye-field")
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 15, height: 15)
                                .foregroundColor(showPassword ? .appBlue : .lightGray)
                        }
                        .padding(.trailing, 8)
                        .onTapGesture {
                            self.showPassword.toggle()
                                                        
                            if self.showPassword {
                                self.textState = textBinded
                            } else {
                                self.textState = String(repeating: "•", count: textBinded.count)
                            }
                        }
                    )
                    .onChange(of: textState) { value in
                        if value.count > textBinded.count, let lastChar = value.last {
                            self.textBinded += String(lastChar)
                        } else if value.count < textBinded.count {
                            self.textBinded.removeLast()
                        }
                        
                        
                        if !showPassword {
                            self.textState = String(repeating: "•", count: value.count)
                        }
                    }
            }
            .font(.system(size: 18, weight: .medium, design: fontDesing))
            .foregroundColor(color)
            
            Rectangle()
                .fill(color)
                .frame(maxWidth: .infinity, minHeight: 1.5, maxHeight: 1.5)
        }
        .onDisappear {
            textState = ""
        }
    }
    
    var fontDesing: Font.Design {
        return showPassword ? .default : .monospaced
    }
    
    var color: Color {
        if focused || !textState.isEmpty {
            return .appBlue
        } else {
            return .lightGray
        }
    }
}
