//
//  HealthKitManager.swift
//  BMIDiseaseTracker
//
//  Created by Alexander Zhurov on 10.04.22.
//

import Foundation
import HealthKit

class HealthKitManager: ObservableObject {
    func requestAccess() -> Void {
        let healthStore = HKHealthStore()
        
        // Access Step Count
        let healthKitTypes: Set = [ HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)! ]

        // Check for Authorization
        healthStore.requestAuthorization(toShare: healthKitTypes, read: healthKitTypes) { (success, error) in

            if (success) {

                // Authorization Successful

            } // end if

        } // end of checking authorization
    }
}
