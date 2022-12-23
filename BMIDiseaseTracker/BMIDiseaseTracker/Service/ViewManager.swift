//
//  ViewManager.swift
//  BMIDiseaseTracker
//
//  Created by Alexander Zhurov on 6.04.22.
//

import SwiftUI

struct ViewManager {
    static var main = MainView()
        
    static let shared = ViewManager()
    
    private init() { }
    
    @ViewBuilder
    func getView(_ activeView: ActiveView) -> some View {
        switch activeView {
            case .main: ViewManager.main
        }
    }
    
    enum ActiveView {
        case main
    }
}

