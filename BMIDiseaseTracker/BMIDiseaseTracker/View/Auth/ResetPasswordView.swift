//
//  ResetPasswordView.swift
//  BMIDiseaseTracker
//
//  Created by Alexander Zhurov on 7.04.22.
//

import SwiftUI

struct ResetPasswordView: View {
    @State var credential: String = ""
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            AuthPageLogo()
                        
            VStack(spacing: 15) {
                Text("Reset Password")
                    .font(.system(size: 24, weight: .bold))
                Text("If you've forgotten your password enter your e-mail address and we send you a verification code, then you can reset your password.")
                    .tracking(0.1)
                    .multilineTextAlignment(.center)
                    .lineSpacing(7)
                    
                    .font(.system(size: 18, weight: .regular))
                    .foregroundColor(.wireframing)
            }
            .padding(.horizontal, 15)
            .frame(maxHeight: .infinity, alignment: .center)
            

            
            UnderlinedField("Enter your Email ID", text: $credential)
                .frame(maxHeight: .infinity, alignment: .center)
                        
            
            ButtonBordered(label: "Confirm", disabled: !credential.isValidEmail, color: buttonColor) {
                confirmAction()
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom, Screen.height * 0.09)
            .padding(.horizontal, 60)
        }
        .padding(.horizontal, 20)
        .edgesIgnoringSafeArea(.all)
        .onDisappear {
            credential = ""
        }
    }
    
    private func confirmAction() -> Void {
        LoadingManager.shared.show = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            LoadingManager.shared.show = false
            self.presentationMode.wrappedValue.dismiss()
            PopoverManager.shared.success("Password successfully restored. Check your e-mail.", delay: 0.5)
        }
    }
    
    private var buttonColor: ButtonBordered.ColorScheme {
        credential.isValidEmail ? .blue : .gray
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
