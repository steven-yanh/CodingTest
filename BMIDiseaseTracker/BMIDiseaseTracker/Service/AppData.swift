//
//  AppData.swift
//  BMIDiseaseTracker
//
//  Created by Alexander Zhurov on 6.04.22.
//

import Foundation

class AppData: ObservableObject {
    @Published var isGreetingShown: Bool
    
    static let shared = AppData()
        
    private init() {
        self.isGreetingShown = UserDefaults.standard.bool(forKey: "isGreetingShown")
    }
    
    func setGreetingShown(_ value: Bool = true) -> Void {
        isGreetingShown = value
        UserDefaults.standard.set(value, forKey: "isGreetingShown")
    }
}
