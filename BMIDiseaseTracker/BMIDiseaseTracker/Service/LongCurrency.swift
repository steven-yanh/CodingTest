//
//  LongCurrency.swift
//  BMIDiseaseTracker
//
//  Created by Huang Yan on 12/23/22.
//

import Foundation

struct LongCurrency {
    
    private var balance: Int
    private var profile = ProfileManager.shared
    
    
    init(balance: Int) {
        self.balance = balance
    }
    
    func getBalance() -> Int {
        return balance
    }
    
    mutating func useCurrency(cost: Int) -> Bool { //Check if balance is enough
        if balance >= cost {
            balance -= cost
            profile.profile?.balance = balance
            profile.updateProfile()
            return true
        } else {
            return false
        }
    }
    
    mutating func gainCurrency(amount: Int) {
        balance += amount
        profile.profile?.balance = balance
        profile.updateProfile()
    }
}
