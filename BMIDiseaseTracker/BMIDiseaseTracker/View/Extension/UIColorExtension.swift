//
//  UIColorExtension.swift
//  BMIDiseaseTracker
//
//  Created by Alexander Zhurov on 5.04.22.
//

import UIKit

public extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hex: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        var color: UInt64 = 0
        
        if (hex.hasPrefix("#")) {
            hex = String(hex.dropFirst())
        }
        
        Scanner(string: hex).scanHexInt64(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .init(x: 1, y: 1), size: size))
        }
    }
    
    static let appBlue         = UIColor(hex: "#3683FC")
    static let lightGray       = UIColor(hex: "#E1E1E1")
    static let placeholderGray = UIColor(hex: "#8E8F9C")
    static let wireframing     = UIColor(hex: "#959595")
    static let itemIconGray    = UIColor(hex: "#A5A5B0")
}

