//
//  MainView.swift
//  BMIDiseaseTracker
//
//  Created by Alexander Zhurov on 6.04.22.
//

import SwiftUI

struct MainView: View {
    @State var activeView: Int = 0
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                VStack(spacing: 0) {
                    ZStack {
                        HStack(spacing: 15) {
                            Image("profile-image-stub")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60)
                            VStack(alignment: .leading, spacing: 5) {
                                HStack(spacing: 7) {
                                    Text("Krishna Vamsi")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .bold))
                                    Image("icon-gear")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 13)
                                    Spacer()
                                    VStack(spacing: 3) {
                                        Image(systemName: "circle.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 3.5)
                                        Image(systemName: "circle.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 3.5)
                                    }
                                    .foregroundColor(.white)
                                }
                                HStack(spacing: 5) {
                                    Image("icon-last-updated")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 12)
                                    Text("Last Updated")
                                        .fontWeight(.medium)
                                    Text("11 Sep, 2021")
                                        .fontWeight(.bold)
                                }
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .foregroundColor(.white)
                                .font(.system(size: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(.white, lineWidth: 1)
                                )
                            }
                            
                            
                        }
                        .frame(height: geo.size.height * 0.25)
                        .padding(.horizontal, 20)
                        
                        HStack(spacing: 0) {
                            Image("icon-home")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 20)
                                .padding(.bottom, 20)
                                .frame(maxWidth: .infinity)
                                .background(
                                    VStack {
                                        if activeView == 0 {
                                            Color.white.frame(height: 4)
                                        } else {
                                            Color.clear.frame(height: 4)
                                        }
                                        Spacer()
                                    }
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                    .background(Color.clear)
                                    .offset(y: 36)
                                )
                                .onTapGesture {
                                    withAnimation {
                                        activeView = 0
                                    }
                                }
                            Image("icon-analysis")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 20)
                                .padding(.bottom, 20)
                                .frame(maxWidth: .infinity)
                                .background(
                                    VStack {
                                        if activeView == 1 {
                                            Color.white.frame(height: 4)
                                        } else {
                                            Color.clear.frame(height: 4)
                                        }
                                        Spacer()
                                    }
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                    .background(Color.clear)
                                    .offset(y: 36)
                                )
                                .onTapGesture {
                                    withAnimation {
                                        activeView = 1
                                    }
                                }
                               
                            Image("icon-recomendations")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 20)
                                .padding(.bottom, 20)
                                .frame(maxWidth: .infinity)
                                .background(
                                    VStack {
                                        if activeView == 2 {
                                            Color.white.frame(height: 4)
                                        } else {
                                            Color.clear.frame(height: 4)
                                        }
                                        Spacer()
                                    }
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                    .background(Color.clear)
                                    .offset(y: 36)
                                )
                                .onTapGesture {
                                    withAnimation {
                                        activeView = 2
                                    }
                                }
                           
                        }
                        .frame(height: geo.size.height * 0.25, alignment: .bottom)
                    }
                    .edgesIgnoringSafeArea(.all)
                    TabView(selection: $activeView) {
                        HomeView().tag(0).id(0)
                        ReportAndAnalysisView().tag(1).id(1)
                        RecommendationsView().tag(2).id(2)
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .frame(width: geo.size.width, height: geo.size.height)
                .background(
                    VStack {
                        LinearGradient(
                            colors: [Color(hex: "#40a3fd"), Color.appBlue, Color.appBlue, Color.appBlue, Color.appBlue],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .frame(height: geo.size.height * 0.25)
                        .shadow(color: .gray, radius: 4, x: 0, y: 0)
                        Spacer()
                    }
                )
                .edgesIgnoringSafeArea(.all)
            }
            .navigationViewStyle(.stack)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


