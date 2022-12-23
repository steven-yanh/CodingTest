//
//  PopoverManager.swift
//  BMIDiseaseTracker
//
//  Created by Alexander Zhurov on 7.04.22.
//

import Foundation

final class PopoverManager: ObservableObject {
    @Published var stack: [Popover] = []
    
    struct Popover: Identifiable {
        let id: String
        let type: PopoverType
        let message: String
        var delay: Double = 0.5
    }
        
    enum PopoverType {
        case success
        case error
        case info
        case none
    }
    
    var popoverType: PopoverType = .none
    
    static let shared = PopoverManager()
    
    private init() { }
    
    func success(_ popoverMessage: String, delay: Double = 0.5) -> Void {
        let popover = Popover(id: "".randomString(length: 10), type: .success, message: popoverMessage, delay: delay)
        stack.append(popover)
    }
    
    func error(_ popoverMessage: String, delay: Double = 0.5) -> Void {
        let popover = Popover(id: "".randomString(length: 10), type: .error, message: popoverMessage, delay: delay)
        stack.append(popover)
    }
    
    func info(_ popoverMessage: String, delay: Double = 0.5) -> Void {
        let popover = Popover(id: "".randomString(length: 10), type: .info, message: popoverMessage, delay: delay)
        stack.append(popover)
    }
    
    func remove(popover: Popover) -> Void {
        guard let popoverIndex = stack.firstIndex(where: {$0.id == popover.id}) else {
            return
        }
 
        stack.remove(at: popoverIndex)
    }
}

