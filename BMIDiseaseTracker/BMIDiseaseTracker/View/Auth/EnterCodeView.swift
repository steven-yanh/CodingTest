//
//  EnterCode.swift
//  BMIDiseaseTracker
//
//  Created by Alexander Zhurov on 10.04.22.
//

import SwiftUI

struct EnterCodeView: View {
    @State var code: String = ""
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            AuthPageLogo()
                        
            VStack(spacing: 15) {
                Text("Enter Code")
                    .font(.system(size: 24, weight: .bold))
                Text("Enter your six digit verification code we have sent you in your email.")
                    .tracking(0.1)
                    .multilineTextAlignment(.center)
                    .lineSpacing(7)
                    
                    .font(.system(size: 18, weight: .regular))
                    .foregroundColor(.wireframing)
            }
            .padding(.horizontal, 15)
            .frame(maxHeight: .infinity, alignment: .center)
            

            
            UnderlinedField("Enter Verification Code", text: $code)
                .frame(maxHeight: .infinity, alignment: .center)
                        
            
            ButtonBordered(label: "Confirm", disabled: code.isEmpty || code.count < 6, color: buttonColor) {
                confirmAction()
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom, Screen.height * 0.09)
            .padding(.horizontal, 60)
        }
        .padding(.horizontal, 20)
        .edgesIgnoringSafeArea(.all)
        .onDisappear {
            code = ""
        }
    }
    
    private func confirmAction() -> Void {
        LoadingManager.shared.show = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            LoadingManager.shared.show = false
            self.presentationMode.wrappedValue.dismiss()
            PopoverManager.shared.success("Code accepted", delay: 0.5)
        }
    }
    
    private var buttonColor: ButtonBordered.ColorScheme {
        code.isEmpty || code.count < 6 ? .gray : .blue
    }
}

struct EnterCode_Previews: PreviewProvider {
    static var previews: some View {
        EnterCodeView()
    }
}
