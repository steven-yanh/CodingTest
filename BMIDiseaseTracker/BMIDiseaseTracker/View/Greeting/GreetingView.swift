//
//  GreetingView.swift
//  BMIDiseaseTracker
//
//  Created by Alexander Zhurov on 5.04.22.
//

import SwiftUI

struct GreetingView: View {    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HStack(spacing: 12) {
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .layoutPriority(1)
                    Divider()
                        .frame(width: 1)
                        .background(Color.appBlue)
                    Text("BMI Disease Tracker")
                        .lineLimit(1)
                        .font(.system(size: 20))
                        .foregroundColor(.appBlue)
                }
                .frame(height: 45)
                .padding(.top, 25)
                
                VStack {
                    VStack(spacing: 0) {
                        Text("Welcome To The Only")
                            .foregroundColor(.appBlue)
                            .font(.system(size: 32))
                        Text("One Of It's Kind")
                            .foregroundColor(.appBlue)
                            .font(.system(size: 32))
                        Text("AI Health Assistance")
                            .foregroundColor(.appBlue)
                            .font(.system(size: 32, weight: .semibold))
                        Image("underline")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 305)
                    }
                    
                    NavigationLink(destination: AdvantagesView().navigationBarHidden(true)) {
                        Text("Let's Get Started")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .padding(14)
                            .buttonStyle(.plain)
                            .background(Color.appBlue)
                            .cornerRadius(12)
                    }
                    .padding(EdgeInsets(top: 40, leading: 20, bottom: 0, trailing: 20))
                    
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(.bottom, UIScreen.main.bounds.height * 0.09)
                .edgesIgnoringSafeArea(.bottom)
                .background(
                    LinearGradient(
                        colors: [.white, .white, .white, .white.opacity(0.7), .white.opacity(0.1), .white.opacity(0), .white.opacity(0)],
                        startPoint: .bottom,
                        endPoint: .top
                    )
                )
            }
            .navigationBarHidden(true)
            .background(
                VStack {
                    Image("hand")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width * 0.87, alignment: .trailing)
                        .padding(.top, 90)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            )
        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
    }
}

struct GreetingView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingView()
    }
}
