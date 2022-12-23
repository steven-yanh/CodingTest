//
//  ContentView.swift
//  BMIDiseaseTracker
//
//  Created by Alexander Zhurov on 5.04.22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var appData = AppData.shared
    @ObservedObject var loadingManager = LoadingManager.shared
    @ObservedObject var authManager = AuthManager.shared
    
    var disabled: Bool {
        get {
            return loadingManager.show
        }
    }
        
    var brightness: Double {
        get {
            return disabled ? -0.5 : 0.001
        }
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                PopoverView()
                LoadingView()
                
                if !appData.isGreetingShown {
                    GreetingView()
                } else {
                    switch authManager.state {
                    case .loggedIn:
                        Color.white.edgesIgnoringSafeArea(.all).brightness(brightness).onAppear { authManager.loadUser() }
                    case .userLoaded:
                        MainView()
                            .disabled(disabled)
                            .brightness(brightness)
                            .animation(.easeIn, value: brightness)
                    default:
                        SignInView()
                            .disabled(disabled)
                            .brightness(brightness)
                            .animation(.easeIn, value: brightness)
                    }
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
