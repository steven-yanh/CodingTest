//
//  LoadingView.swift
//  BMIDiseaseTracker
//
//  Created by Alexander Zhurov on 7.04.22.
//

import SwiftUI

struct LoadingView: View {
    @ObservedObject var loadingManager = LoadingManager.shared
    @State var degrees: Double = 0
    
    var body: some View {
        if loadingManager.show {
            Circle()
                .stroke(AngularGradient(
                    gradient: Gradient(colors: [Color.white.opacity(0.05), Color.white.opacity(1)]),
                    center: .center,
                    startAngle: .degrees(0),
                    endAngle: .degrees(359)),
                    style: StrokeStyle(lineWidth: 6, lineCap: .round)
                )
                .frame(width: UIScreen.main.bounds.width * 0.35)
                .rotationEffect(.degrees(degrees))
                .background(
                    VStack {
                        Text("BMI")
                            .font(.system(size: 32, weight: .bold))
                        Text("Tracker")
                            .font(.system(size: 18, weight: .bold))
                    }
                    .foregroundColor(.white)
                )
                .onAppear {
                    withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                        degrees = 360
                    }
                }
                .onDisappear {
                    degrees = 0
                }
                .zIndex(999)
        } else {
            EmptyView()
        }
    }
}


struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
