//
//  AuthPagesLogo.swift
//  BMIDiseaseTracker
//
//  Created by Alexander Zhurov on 10.04.22.
//

import SwiftUI

struct AuthPageLogo: View {
    var body: some View {
        Group {
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(height: 80)
        }
        .frame(maxHeight: .infinity, alignment: .center)
        .padding(.top, Screen.height * 0.1)
    }
}
