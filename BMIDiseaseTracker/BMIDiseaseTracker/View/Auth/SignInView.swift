//
//  SignInView.swift
//  BMIDiseaseTracker
//
//  Created by Alexander Zhurov on 6.04.22.
//

import SwiftUI

struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                AuthPageLogo()
                
                VStack(spacing: 5) {
                    UnderlinedField("Email ID", text: $email)
                    UnderlinedSecureField("Password", text: $password)
                        .padding(.top, 27)
                    resetPasswordLink
                }
                .frame(maxHeight: .infinity, alignment: .center)
                
                                                
                VStack(spacing: Screen.height * 0.028) {
                    ButtonFilled(label: "Log Into Your Account", disabled: loginButtonDisabled) {
                        loginAction()
                    }
                                    
                    SocialNetworkAuth()
                }
                .frame(maxHeight: .infinity, alignment: .top)

                LinkButtonBordered(label: "Create a New Account", destination: SignUpView())
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .padding(.bottom, Screen.height * 0.09)
            }
            .padding(.horizontal, 20)
            .edgesIgnoringSafeArea(.all)
            .onDisappear {
                email = ""
                password = ""
            }
        }
    }
    
    private func loginAction() -> Void {
        LoadingManager.shared.show = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            LoadingManager.shared.show = false
            AuthManager.shared.login(login: "", password: "")
        }
    }
    
    private var resetPasswordLink: some View {
        HStack {
            Spacer()
            NavigationLink(destination: ResetPasswordView()) {
                Text("Don't Remember?")
                    .font(.system(size: 12, weight: .light))
                    .foregroundColor(.black)
                    .underline()
            }
        }
    }
    
    private var loginButtonDisabled: Bool {
        email.isEmpty || !email.isValidEmail || password.isEmpty
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
