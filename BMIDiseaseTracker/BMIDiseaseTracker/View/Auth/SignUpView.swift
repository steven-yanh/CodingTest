//
//  SignUpView.swift
//  BMIDiseaseTracker
//
//  Created by Alexander Zhurov on 7.04.22.
//

import SwiftUI

struct SignUpView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var passwordRepeat: String = ""
    @State var agree: Bool = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack(spacing: 0) {
            AuthPageLogo()
            
            VStack(spacing: Screen.height * 0.0356) {
                UnderlinedField("Email ID", text: $email)
                UnderlinedSecureField("Password", text: $password)
                UnderlinedSecureField("Confirm password", text: $passwordRepeat)
            }
            .frame(maxHeight: .infinity, alignment: .center)

            VStack(spacing: Screen.height * 0.028) {
                if Screen.height < 700 { Spacer() }
                
                VStack(spacing: 3) {
                    agreement
                    ButtonFilled(label: "Create an Account Now", disabled: createAccountButtonDisabled) {
                        createAccountAction()
                    }
                }
                
                SocialNetworkAuth()
            }
            .frame(maxHeight: .infinity, alignment: .top)
               
            
            ButtonBordered(label: "Already Registered? Login Now") {
                self.presentationMode.wrappedValue.dismiss()
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom, Screen.height * 0.09)
        }
        .padding(.horizontal, 20)
        .edgesIgnoringSafeArea(.all)
        .onDisappear {
            email = ""
            password = ""
            passwordRepeat = ""
        }
    }
    
    private var agreement: some View {
        HStack(spacing: 3) {
            Text("I agree on")
                .foregroundColor(.wireframing)
            NavigationLink(destination: Text("Terms and conditions page")) {
                Text("terms and conditions")
                    .foregroundColor(.appBlue)
                    .underline()
            }
            .layoutPriority(1)
            Spacer()
            Toggle("", isOn: $agree)
                .scaleEffect(x: 0.6, y: 0.5, anchor: .trailing)
                .padding(.trailing, 1)
                .toggleStyle(SwitchToggleStyle(tint: .appBlue))
        }
        .font(.system(size: 13, weight: .regular))
    }
    
    private func createAccountAction() -> Void {
        LoadingManager.shared.show = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            LoadingManager.shared.show = false
            self.presentationMode.wrappedValue.dismiss()
            PopoverManager.shared.success("Account was created successfully! Check your e-mail.", delay: 0.5)
        }
    }
    
    private var createAccountButtonDisabled: Bool {
        email.isEmpty ||
        !email.isValidEmail ||
        password.isEmpty ||
        passwordRepeat.isEmpty ||
        password != passwordRepeat ||
        !agree
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
