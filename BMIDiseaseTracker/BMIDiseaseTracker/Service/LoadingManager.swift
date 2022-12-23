//
//  LoadingManager.swift
//  BMIDiseaseTracker
//
//  Created by Alexander Zhurov on 7.04.22.
//

import SwiftUI

final class LoadingManager: ObservableObject {
    @Published var show: Bool = false
    var activeRequests: [String] = []
    
    static let shared = LoadingManager()
    
    private init() { }
    
    func bindRequest(url: String) -> Void {
        activeRequests.append(url)
        self.show = true
    }
    
    func unbindRequest(url: String) -> Void {
        self.activeRequests.removeAll(where: { $0 == url })
        if self.activeRequests.isEmpty {
            self.show = false
        }
    }
}

