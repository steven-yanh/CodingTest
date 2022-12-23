//
//  ColorExtension.swift
//  BMIDiseaseTracker
//
//  Created by Alexander Zhurov on 5.04.22.
//

import SwiftUI

extension Color {
    init(hex: String, alpha: CGFloat = 1.0) {
        self.init(UIColor(hex: hex, alpha: alpha))
    }
    
    static let appBlue         = Color(UIColor.appBlue)
    static let lightGray       = Color(UIColor.lightGray)
    static let placeholderGray = Color(UIColor.placeholderGray)
    static let wireframing     = Color(UIColor.wireframing)
    static let itemIconGray    = Color(UIColor.itemIconGray)
    
    static func hex(_ hex: String, alpha: CGFloat = 1.0) -> Color {
        return Color(hex: hex, alpha: alpha)
    }
}

