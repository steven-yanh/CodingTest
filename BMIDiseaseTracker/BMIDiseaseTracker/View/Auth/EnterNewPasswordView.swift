//
//  EnterNewPasswordView.swift
//  BMIDiseaseTracker
//
//  Created by Alexander Zhurov on 10.04.22.
//

import SwiftUI

struct EnterNewPasswordView: View {
    @State var password: String = ""
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            AuthPageLogo()
                        
            VStack(spacing: 15) {
                Text("Enter New Password")
                    .font(.system(size: 24, weight: .bold))
                Text("Enter your new passord, please, try to use numbers and english letters in it, you need to enter from 6 to 10 symbols.")
                    .tracking(0.1)
                    .multilineTextAlignment(.center)
                    .lineSpacing(7)
                    
                    .font(.system(size: 18, weight: .regular))
                    .foregroundColor(.wireframing)
            }
            .padding(.horizontal, 15)
            .frame(maxHeight: .infinity, alignment: .center)
            

            
            UnderlinedSecureField("Enter New Password", text: $password)
                .frame(maxHeight: .infinity, alignment: .center)
                        
            
            ButtonBordered(label: "Confirm", disabled: password.isEmpty || password.count < 8, color: buttonColor) {
                confirmAction()
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom, Screen.height * 0.09)
            .padding(.horizontal, 60)
        }
        .padding(.horizontal, 20)
        .edgesIgnoringSafeArea(.all)
        .onDisappear {
            password = ""
        }
    }
    
    private func confirmAction() -> Void {
        LoadingManager.shared.show = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            LoadingManager.shared.show = false
            self.presentationMode.wrappedValue.dismiss()
            PopoverManager.shared.success("New password accepted", delay: 0.5)
        }
    }
    
    private var buttonColor: ButtonBordered.ColorScheme {
        password.isEmpty || password.count < 8 ? .gray : .blue
    }
}

struct EnterNewPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        EnterNewPasswordView()
    }
}
