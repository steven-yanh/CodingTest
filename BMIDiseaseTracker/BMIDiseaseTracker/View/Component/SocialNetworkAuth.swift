//
//  SocialAuth.swift
//  BMIDiseaseTracker
//
//  Created by Alexander Zhurov on 10.04.22.
//

import SwiftUI

struct SocialNetworkAuth: View {
    var body: some View {
        VStack(spacing: Screen.height * 0.028) {
            Rectangle()
                .fill(Color.lightGray)
                .frame(height: 1)
                .overlay(
                    HStack {
                        Spacer()
                        Text("or")
                            .font(.system(size: 14, weight: .medium))
                            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                            .foregroundColor(.placeholderGray)
                            .background(Color.white)
                        Spacer()
                    }
                )
            
            
            
            HStack(spacing: 50) {
                Image("icon-google")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                Image("icon-apple")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                Image("icon-facebook")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
            }
        }
    }
}

struct SocialNetworkAuth_Previews: PreviewProvider {
    static var previews: some View {
        SocialNetworkAuth()
    }
}
